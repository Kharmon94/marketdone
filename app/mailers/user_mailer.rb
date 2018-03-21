class UserMailer < ApplicationMailer

  default from: 'kyleharmon52@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to The Marketlace')
  end

end
