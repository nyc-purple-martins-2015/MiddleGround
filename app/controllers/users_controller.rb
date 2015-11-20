class UsersController < ApplicationController

  def index
  end

  def geocoding
    respond_to do |format|
    format.js
    end
  end
end
