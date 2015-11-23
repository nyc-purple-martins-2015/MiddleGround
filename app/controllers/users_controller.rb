class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(lat: params[:user][:lat], long: params[:user][:long])
    redirect_to root_path
  end

  def show
    @user = current_user
    available_friends = User.all.select { |user| (!user.friends.include?(current_user) && user != current_user) }
    @registered_users = available_friends.map { |user| [user.username, user.id]}
    @friendships_pending = current_user.pending_friendships
  end
end
