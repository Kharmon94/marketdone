class SubscribersController < ApplicationController
	  before_action :authenticate_user!

	def new
	end

	def update
	#gets the credit card details submitted in the form

    token = params[:stripeToken]

  begin

    #create a customer
    customer = Stripe::Customer.create(
      source: token,
      email: current_user.email
    )

    current_user.stripe_id = customer.id
    
    subscription = Stripe::Subscription.create({
      customer: customer.id,
      items: [{plan: 'plan_CfIMakVxUJCgRv'}],
    })

    
    current_user.subscribed = true
    current_user.save
  end

    redirect_to new_business_path, notice: "Your subscription was set up successfully! Post Up Your Business!"

	end
end
