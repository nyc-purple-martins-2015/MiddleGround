class UserMailer < ApplicationMailer

  def welcome_email(target_user)
    @user = target_user
    @url  = 'http://middle-ground.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to MiddleGround!')
  end
end
