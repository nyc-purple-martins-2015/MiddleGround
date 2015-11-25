class ActivitiesController < ApplicationController
  def new
    if logged_in?
      @users = (current_user.friends).map{|user| [user.username, user.id, {:'data-lat' => user.lat, :'data-long' => user.long, :'data-id' => user.id, class: "user-#{user.id}"}]}
      @category_filter = Activity.parse_businesses(categories)
    else
      redirect_to login_path
    end
  end

  def create
    @friend= User.find(params[:friend].to_i)
    destination = business(Yelp.client.search_by_coordinates(midpoint_location, search_parameters))
    coords = destination.location.coordinate
    address = destination.location.display_address.join(", ")
    @activity = Activity.new(location: address, title: destination.name, creator_id: current_user.id, friend_id: params[:friend].to_i, lat: coords.latitude, long: coords.longitude)
    if @activity.save!
      @friend = User.find(@activity.friend_id)
      render :show, layout:false
    else
      status 400
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def direction
    @origin = { lat: params["data-origin-lat"], lng: params["data-origin-long"] }
    @destination = { lat: params["data-destination-lat"], lng: params["data-destination-long"] }
  end

  private

  def activity_params
    params.permit(:activity, :midlat, :midlong)
  end

  def yelp
    File.read("vendor/assets/javascripts/categories.json")
  end

  def categories
    params[:'data-type'] = ['active', 'restaurants', 'arts', 'bars'].sample unless params[:'data-type']
    JSON.parse(yelp).select{ |business| business["parents"].include?(params[:'data-type'])}
  end

  def business(search_results)
    search_results.businesses.select { |business| !business.is_closed }.sample
  end

  def search_parameters
    { term: params[:activity], radius_filter: 800 }
  end

  def midpoint_location
    {latitude: params[:midlat], longitude: params[:midlong]}
  end
end
