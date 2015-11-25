class ActivityMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def activity_email(activity)
    @user = activity.creator
    @friend = activity.friend
    @url  = 'http://middle-ground.herokuapp.com'
     mail(to: [@friend.email, @user.email], subject: 'You Have a New MiddleGround!')
  end
end
