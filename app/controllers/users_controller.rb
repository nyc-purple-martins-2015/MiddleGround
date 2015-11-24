class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(lat: params[:user][:lat], long: params[:user][:long])
    redirect_to root_path
  end

  def show
    if logged_in?
      @user = current_user
      available_friends = User.all.select { |user| (!user.friends.include?(@user) && user != @user) }
      @registered_users = available_friends.map { |user| [user.username, user.id]}
      @friendships_pending = @user.pending_friendships
    else
      redirect_to login_path
    end
  end
end
