class ActivitiesController < ApplicationController

  def search
    params = {
      term: 'movies',
      category_filter: 'movietheaters'
    }
    # render json: Yelp.client.search('Waterford, CT', params).businesses.map{|business| "#{business.name} #{business.location.display_address}"}.sample
    render json: Yelp.client.search("cll= 40.7, 74.0", params).businesses.map {|business| business.name }
<<<<<<< b0e03e78a48946bd7c01c3a240d913367f4ee134
=======

>>>>>>> Take out trial js code
  end

  def new
  end

  def create
  end

  def show
<<<<<<< b0e03e78a48946bd7c01c3a240d913367f4ee134
    @activity = Activity.find_by(activity_params)
  end


=======

    @activity = Activity.find_by(activity_params)

  end

  def index
    @activities = Activity.all
  end
>>>>>>> Take out trial js code



  def activity_params
      params.require(:activity).permit(:address, :lat,:long)
  end
end
