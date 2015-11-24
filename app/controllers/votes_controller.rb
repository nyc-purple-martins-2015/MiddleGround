class VotesController < ApplicationController
  def create
    vote = current_user.votes.new(vote_params)
    if vote.save
      redirect_to user_path(current_user)
    else
      status 422
    end
  end

  private

  def vote_params
     params.require(:vote).permit(:user_id, :activity_id, :value)
  end
end
