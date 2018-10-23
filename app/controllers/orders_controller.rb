class OrdersController < ApplicationController
  before_action :set_product, only: [:checkout]
  before_action :authenticate_user!


  # GET /orders/new
  def new
    @order = Order.new
    @product = Product.find_by_id(params[:product_id])


  end
  
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @product = Product.find_by_id(params[:product_id])
    @seller = @product.user

    @order.product_id = @product.id
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id


      if @order.valid?
        begin
            @amount = ((@product.price + @product.shipping_cost) * @order.quantity).to_i * 100
            application_fee = (@amount * 0.1).to_i     # 10%

              customer = Stripe::Customer.create(
                email: params[:stripeEmail],
                source: params[:stripeToken]
              )

              charge_params = {
                customer: customer.id,
                amount: @amount,
                description: @product.title,
                currency: 'usd',
                destination: @product.user.uid,
                application_fee: application_fee,
                capture: true
             
              }


                Stripe::Charge.create(charge_params) # return a Stripe::Charge object



                  rescue Stripe::CardError => e
                    flash[:error] = e.message
                    render :new
                  end
   
              end

              






    respond_to do |format|
      if @order.save
        format.html { redirect_to purchases_path, notice: 'Thank You So Much For Your Order Family! Contact your seller for shipping information'}
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkout
    @product = Product.find_by_id(params[:product_id])
  end


  def sales
    @orders = Order.all.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by_id(params[:id])
    end

    def set_product
      @product = Product.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state, :zip, :quantity, :color, :size, :country, :stripeEmail, :stripeToken)

    end
end
