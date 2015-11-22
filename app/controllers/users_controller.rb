class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(lat: params[:user][:lat], long: params[:user][:long])
    redirect_to root_path
  end
end
