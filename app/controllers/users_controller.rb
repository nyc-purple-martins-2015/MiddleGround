class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(lat: params[:user][:lat], long: params[:user][:long])
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    available_friends = User.all.select { |user| (!user.friends.include?(@user) && user != @user) }
    @registered_users = available_friends.map { |user| [user.username, user.id]}
    @friendships_pending = @user.pending_friendships
  end
end
