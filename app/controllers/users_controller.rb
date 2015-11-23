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

    # I'll look at this to see if we can do in the db
    available_friends = User.all.select { |user| (!user.friends.include?(@user) && user != @user) }

    # You should be able to use a different options helper and not need this map
    @registered_users = available_friends.map { |user| [user.username, user.id]}
    # You don't need this - use the association method in the view instead
    @friendships_pending = @user.pending_friendships
  end
end
