class ActivitiesController < ApplicationController
  def new
    @users = (User.all - [current_user]).map{|user| [user.username, user.id, {:'data-lat' => user.lat, :'data-long' => user.long}]}
    yelp = File.read("vendor/assets/javascripts/categories.json")
    categories = JSON.parse(yelp).select{ |business| business["parents"].include?(params[:'data-type'])}
    @category_filter = categories.map {|category_filter| [category_filter["title"], category_filter["alias"]]}
  end

  def create
    location = {latitude: params[:midlat], longitude: params[:midlong]}
    parameters = {
      term: params[:activity],
      radius_filter: 800
    }
   destination = Yelp.client.search_by_coordinates(location, parameters).businesses.select { |business| !business.is_closed }.sample
   title = destination.name
   address = destination.location.display_address.join(", ")
   @activity = Activity.new(location: address, title: title, creator_id: current_user.id, friend_id: params[:friend].to_i)
    if @activity.save!
    # byebug
      @friend = User.find(@activity.friend_id)
      render :show, layout:false
    else
      flash[:errors] = "Something went wrong with your request. Please try again."
      redirect_to new_activity_path
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params.permit(:activity, :midlat, :midlong)
  end
end
