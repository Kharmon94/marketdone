class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


   def assign_env_variable
    gon.stripe_key = ENV['PUBLISHABLE_KEY']
  end



  protected

  def configure_permitted_parameters

 	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :bio, :street_address, :city, :zipcode, :birthday, :image, :email, :password,  :remember_me])
 	devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password,  :remember_me])
 	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :bio, :street_address, :city, :zipcode, :birthday, :image, :email, :password,  :remember_me])
  end



end
