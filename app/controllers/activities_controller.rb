class ActivitiesController < ApplicationController

  def search
    params = {
      term: 'movies',
      category_filter: 'movietheaters'
    }
    # render json: Yelp.client.search('Waterford, CT', params).businesses.map{|business| "#{business.name} #{business.location.display_address}"}.sample
    render json: Yelp.client.search("cll= 40.7, 74.0", params).businesses.map {|business| business.name }
  end

  def new
    @activity = Activity.new
  end

  def create
    activity = Activity.new(activity_params)
    if activity.save
      render json: Yelp.client.search(location, params).businesses.map{|business| "#{business.name} #{businessesusiness.location.display_address}"}.sample
      redirect_to activity_path
    else
      flash[:errors] = "Something went wrong with your request. Please try again."
      redirect_to new_activity_path
    end
  end

  def show
    @activity = Activity.find_by(activity_params)
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :address, :creator_id, :friend_id)
  end
end
