class FriendshipsController < ApplicationController
  def create
    # You don't need the !! here
    if !!params[:friendship]
      friendship = current_user.requested_friendships.new(friendship_params)
      if friendship.save
        flash[:notice] = "Your friend request has been submitted."
        redirect_to user_path(current_user)
      else
        #Why would this fail, and what can the user do to fix it?
        flash[:notice] = "Your friend request has not been submitted. Please try again."
        redirect_to user_path(current_user)
      end
    else
      # What's the logic here? How would this create method get called without the param?
      flash[:notice] = "Please wait for more people to join MiddleGround!"
      redirect_to user_path(current_user)
    end
  end

  def accept
    friendship = Friendship.find(params[:id])
    #You presume success here - should you wait and check the save / update succeeds?
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
