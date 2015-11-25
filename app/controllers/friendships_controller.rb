class FriendshipsController < ApplicationController
  def create
    if !!params[:friendship]
      friendship = current_user.requested_friendships.new(friendship_params)
      if friendship.save
        flash[:notice] = "Your friend request has been submitted."
        redirect_to user_path(current_user)
      else
        flash[:notice] = "Your friend request has not been submitted. Please try again."
        redirect_to user_path(current_user)
      end
    else
      flash[:notice] = "Please wait for more people to join MiddleGround!"
      redirect_to user_path(current_user)
    end
  end

  def accept
    friendship = Friendship.find(params[:id])
    flash[:notice] = "You are now friends with #{ friendship.requester.username }."
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
