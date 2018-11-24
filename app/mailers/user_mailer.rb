class UserMailer < ApplicationMailer

  default from: 'Theblackwomanisgodstores@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://Theblackwomanisgodstores.com/login'
    mail(to: @user.email, subject: 'Welcome to The Marketlace')
  end

  def product_email(user)
  	@user = user
  	@url = 'https://Theblackwomanisgodstores.com/products'
  	mail(to: @user.email, subject: 'Thank Your For Adding Your Product!')
  end

  def business_email(user)
  	@user = user
  	@url = 'https://Theblackwomanisgodstores.com/businesses'
  	mail(to: @user.email, subject: 'Thank Your For Registering Your Business With Us!')
  end


end
