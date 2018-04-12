class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @products = Product.all
    @businesses = Business.all
  end

  def update
    @user = User.update(user_params)
    @user = User.find(params[:id])
    if @user.update(user_params)
      if @user.stripe_temporary_token.present?
        customer = Stripe::Customer.create(
          email: @user.email,
          source: @user.stripe_temporary_token
        )
        @user.update_attribute(:stripe_customer_id, customer.id)
      end
    else
      render :show
    end
    redirect_to root_path
  end

  def create
    @user = User.create(user_params)
  end


  private

  def user_params
    params.require(:user).permit(:email,
                                 :stripe_customer_id,
                                 :stripe_temporary_token,
                                 :provider,
                                 :uid,
                                 :publishable_key,
                                 :access_code,
                                 :image,
                                 :first_name,
                                 :last_name,
                                 :username,
                                 :street_address,
                                 :city,
                                 :zipcode,
                                 :birthday,
                                 :bio
                                )
  end

end