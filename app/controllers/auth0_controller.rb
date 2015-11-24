class Auth0Controller < ApplicationController
  def callback
    auth_hash = request.env['omniauth.auth']
    user = User.find_or_create_by(uid: auth_hash['uid'])
    user.username = auth_hash['info']['name']
    user.avatar = auth_hash['info']['image']
    user.save!
    session[:user_id] = user.id
    redirect_to edit_path(user)
  end

  def failure
    @error_msg = request.params['message']
  end
end
