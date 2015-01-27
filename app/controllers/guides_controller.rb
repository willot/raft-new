class GuidesController < ApplicationController
  before_action :guided_cities, only: [:index]

  def index
    @guides = User.where(guide: true)
    @geojson = Array.new

  end

  def new
    @guide = User.find(session[:user_id])
  end

  def find_guides
    @loc = Location.find_by(city: params[:city])
    @guides = @loc.guides
  end

  def guided_cities
    @guided_cities = []
    Location.all.each do |location|
      if location.guides.count != 0
        guided_cities << location
      end
    end
  end
end
