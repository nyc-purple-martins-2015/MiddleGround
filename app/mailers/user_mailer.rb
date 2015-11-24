class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def welcome_email(target_user)
    puts "Called send welcome email"
    @user = target_user
    @url  = 'http://middle-ground.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to MiddleGround!')
    puts "Called send on mailer"
  end
end
