class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to root_path
  end

  def show
    if logged_in?
      # This includes is probably overkill for a single object - includes is useful
      # for collections - e.g if you load a list of friendships and know you'll need 
      # the associated user details. In this case with a single owning user you don't save
      # any queries
      @user = User.includes(:requested_friends, :accepted_friends, :created_activities, :friend_activities, :requested_friendships, :accepted_friendships).find_by(id: current_user.id)
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :phone_number, :lat, :long)
  end
end
