class UsersController < ApplicationController

 before_action :authenticate_user!

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
    @user = User.find_by_id(params[:id])
    @follow = Follow.find_by(follower: @current_user, followable: @user)
    current_user.follow(@user) # => This assumes you have a variable current_user who is authenticated
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find_by_id(params[:id])
    current_user.stop_following(@user) # => This assumes you have a variable current_user who is authenticated
    redirect_to user_path(@user)
  end

 
  def following
    @users = User.all
    @user = User.find_by_id(params[:id])
    @user_following = @user.all_following(:order => 'created_at DESC')
  end

  def followers
    @users = User.all
    @user = User.find_by_id(params[:id])
    @user_followers = @user.followers(:order => 'created_at DESC')
  end

  # def followers
  #    # @users = User.all
  #    # @user = User.find_by_id(params[:id])
  #    # @followers = @user.all_follows(User)
  #    @user = User.find_by_username(params[:username])
  #    @followers = follow.find_by_id(params[:id]).all_follows

  # end

  # def following
  #    # @users = User.all
  #    # @user = User.find_by(params[:user])
  #    # @following = @user.all_following(User)
  #    @user = User.find_by_username(params[:username])
  #    @users = User.find_by_username(params[:username]).all_following
     

  # end

  def create
    @user = User.create(user_params)

    # send welcome email
    UserMailer.welcome_email(@user).deliver

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
                                 :avatar,
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