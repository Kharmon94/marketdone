class SubscribersController < ApplicationController
	  before_action :authenticate_user!

	def new
	end

	def update
	#gets the credit card details submitted in the form
    token = params[:stripeToken]

    #create a customer
    customer = Stripe::Customer.create(
      card: token,
      plan: 1020,
      email: current_user.email
    )

    current_user.subscribed = true
    current_user.stripe_id = customer.id
    current_user.save


    redirect_to new_business_path, notice: "Your subscription was set up successfully! Post Up Your Business!"

	end
end
