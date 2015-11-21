class Auth0Controller < ApplicationController
  def callback
    # ap request.env['omniauth.auth']
    auth_hash = request.env['omniauth.auth']
    user = User.find_or_create_by(uid: auth_hash['uid'])
    user.username = auth_hash['info']['name']
    user.avatar = auth_hash['info']['image']
    user.save!
    session[:user_id] = user.id
    redirect_to root_path
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end