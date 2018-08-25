class UsersController < ApplicationController

 before_action :authenticate_user!, only: [ :update, :show, :create ]

  def show
    @user = User.find_by_id(params[:id])
    @products = Product.all
    @businesses = Business.all
  end

  def update
    @user = User.update(user_params)
    @user = User.find_by_id(params[:id])
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

  def follow
    user = User.find_by_id(params[:id])
    current_user.follow!(user) # => This assumes you have a variable current_user who is authenticated
    redirect_to user_path(user)
  end

  def unfollow
    user = User.find_by_id(params[:id])
    current_user.unfollow!(user) # => This assumes you have a variable current_user who is authenticated
    redirect_to user_path(user)
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
                                 :country,
                                 :birthday,
                                 :bio
                                )
  end

end