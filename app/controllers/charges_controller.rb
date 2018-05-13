class ChargesController < ApplicationController
  before_action :set_item
  

  def new
  end

  def create

    # puts "---- #{@product.inspect}"
    @amount = ((@product.price + @product.shipping_cost).to_i * 100)* params[:quantity]
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
    redirect_to root_path
  end

  def thanks
  end

  private

  def set_item
    @product = Product.find(params[:product_id])
   
  end

end