class SubscribersController < ApplicationController
	  before_action :authenticate_user!

	def new
	end

	def update
	#gets the credit card details submitted in the form
   Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]

    #create a product
    product = Stripe::Product.create({
      name: 'The Black Woman Is God Business Map',
      type: 'service',
    })

    plan = Stripe::Plan.create({
      product: 'plan_CfIMakVxUJCgRv',
      nickname: 'Business Map',
      interval: 'month',
      currency: 'usd',
      amount: 4999,
    })

    #create a customer
    customer = Stripe::Customer.create(
      source: token,
      email: current_user.email
    )

    current_user.subscribed = true
    current_user.stripe_id = customer.id
    current_user.save


    redirect_to new_business_path, notice: "Your subscription was set up successfully! Post Up Your Business!"

	end
end
