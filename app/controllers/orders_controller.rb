class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /orders/new
  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @product = Product.find(params[:product_id])
    @seller = @product.user

    @order.product_id = @product.id
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

    Stripe.api_key = ENV["STRIPE_API_KEY"]
        
    customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
      )
     begin
        @amount = (@product.price + @product.shipping_cost).to_i * 100
        application_fee = (@amount * 0.1).to_i     # 10%


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
          flash[:notice] = "Thanks for ordering!"
        rescue Stripe::CardError => e
          flash[:danger] = e.message
    end




    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Order successfully created placed. Thank You!' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
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
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state, :zip)
    end
end
