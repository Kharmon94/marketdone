class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   def assign_env_variable
    gon.stripe_key = ENV['PUBLISHABLE_KEY']
  end

end
