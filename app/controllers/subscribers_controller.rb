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
      items: [{plan: 'plan_Ch1gdqOXtOmc7o'}],
    })
# live: plan_CfIMakVxUJCgRv
# test: 
    
    current_user.subscribed = true
    current_user.save
  end

    redirect_to new_business_path, notice: "Your subscription was set up successfully! Post Up Your Business!"

	end

  # def cancel_plan
  #   @user = current_user
  #   if @user.cancel_user_plan(params[:customer_id])
  #     @user.update_attributes(customer_id: nil, plan: 'plan_CfIMakVxUJCgRv')
  #     @user.update_attributes(business: nil)
  #     flash[:notice] = "Canceled subscription."
  #     redirect_to root_path
  #   else
  #     flash[:error] = "There was an error canceling your subscription. Please notify us."
  #     redirect_to edit_user_registration_path
  #   end
  # end
end
