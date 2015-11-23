class FriendshipsController < ApplicationController
  def create
    friendship = current_user.requested_friendships.new(friendship_params)
    if friendship.save
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  #if this is the only update possible, maybe rename it accept?
  def update
    friendship = Friendship.find(params[:id])
    friendship.update_attributes(pending: 0)
    redirect_to root_path
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    redirect_to root_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:acceptor_id)
  end
end
