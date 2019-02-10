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

  def seller_email(user)
    @user = user
    @url = 'https://Theblackwomanisgodstores.com/login'
    mail(to: @user.email, subject: 'YOU HAVE A SALE!')
  end

  def buyer_email(user)
    @user = user
    @url = 'https://Theblackwomanisgodstores.com/login'
    mail(to: @user.email, subject: 'Your Order Details')
  end


  def convo_email(user)
    @user = user
    @url = 'https://Theblackwomanisgodstores.com/conversations'
    mail(to: @user.email, subject: 'You got Mail!')
  end

  def shipped_email(user)
    @user = user
    @url = 'https://Theblackwomanisgodstores.com/login'
    mail(to: @user.email, subject: 'Your Order Has Been Shipped')
  end

  def subscriber_email(user)
    @user = user
    @url = 'https://Theblackwomanisgodstores.com/businesses/new'
    mail(to: @user.email, subject: 'Thank you for subscribing, Post your business now!')
  end




end
