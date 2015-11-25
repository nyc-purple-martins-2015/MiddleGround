class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(user_params)
    redirect_to root_path
  end

  def show
    if logged_in?
      @user = User.find_by(id: current_user.id)
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :phone_number, :lat, :long)
  end
end
