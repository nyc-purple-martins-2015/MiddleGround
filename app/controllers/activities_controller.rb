class ActivitiesController < ApplicationController

  def search
    params = {
      term: 'movies',
      category_filter: 'movietheaters'
    }
    render json: Yelp.client.search('Waterford, CT', params).businesses.map{|business| "#{business.name} #{business.location.display_address}"}.sample
  end

  def new
  end

  def create
  end

  def show
  end
end
