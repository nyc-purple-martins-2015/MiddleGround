class ActivityMailer < ApplicationMailer
  def activity_email(activity)
    @user = activity.creator
    @friend = activity.friend
    @url  = 'http://middle-ground.herokuapp.com'
    mail(to: @user.email, subject: 'You Have a New MiddleGround!')
     mail(to: @friend.email, subject: 'You Have a New MiddleGround!')
  end
end
