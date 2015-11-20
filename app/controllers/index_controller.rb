class IndexController < ApplicationController
  def index
    # if !logged_in?
      render :index
    # end
  end
end