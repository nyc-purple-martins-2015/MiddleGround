class FriendshipsController < ApplicationController
  def create
    friendship = current_user.requested_friendships.new(friendship_params)
    if friendship.save
      flash.now[:notice] = "Your friend request has been submitted."
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "Your friend request has not been submitted. Please try again."
      redirect_to user_path(current_user)
    end
  end

  def accept
    friendship = Friendship.find(params[:id])
    flash.now[:notice] = "You are now friends with #{ friendship.requester.username }."
    friendship.update_attributes(pending: 0)
    redirect_to user_path(current_user)
  end

  def reject
    friendship = Friendship.find(params[:id])
    friendship.destroy
    redirect_to user_path(current_user)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:acceptor_id)
  end
end
