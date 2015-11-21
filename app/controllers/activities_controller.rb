class ActivitiesController < ApplicationController

  def search
    params = {
      term: 'movies',
      category_filter: 'movietheaters'
    }
    # render json: Yelp.client.search('Waterford, CT', params).businesses.map{|business| "#{business.name} #{business.location.display_address}"}.sample
    render json: Yelp.client.search("cll= 40.7, 74.0", params).businesses.map {|business| business.name }
<<<<<<< 8a8ef2f582a65212225e9addf32e684f3c391d80
=======

>>>>>>> Add activities routes and lat/long to table
  end

  def new
  end

  def create
  end

  def show
<<<<<<< 8a8ef2f582a65212225e9addf32e684f3c391d80
    @activity = Activity.find_by(activity_params)
=======
    @activity = Activity.find(1)
>>>>>>> Add activities routes and lat/long to table
  end

  def index
    @activities = Activity.all
<<<<<<< 8a8ef2f582a65212225e9addf32e684f3c391d80
  end

  def activity_params
      params.require(:activity).permit(:address, :lat,:long)
=======
>>>>>>> Add activities routes and lat/long to table
  end
end
