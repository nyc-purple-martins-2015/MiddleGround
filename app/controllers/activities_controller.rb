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
  end

  def create
  end

  def show

    @activity = Activity.find_by(activity_params)

  end


  def activity_params
      params.require(:activity).permit(:address, :lat,:long)
  end
end
