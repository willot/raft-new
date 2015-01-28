class GuidesController < ApplicationController
  before_action :guided_locations, only: [:index]

  def index
    #For Mapbox
    @geojson = Array.new
    @guided_locations.each do |location|
      #type key, geometry key & property key required
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [rand(1..90), rand(1..90)] #Should Be [location.lat, location.lng]
        },
        properties: {
          title: location.city.capitalize,
          description: 1,
          :'marker-color' => '#f86767'
        }
      }
    end

      respond_to do |format|
        format.html
        format.json { render json: @geojson }
      end
  end

  def new
    @guide = User.find(session[:user_id])
  end

  def find_guides
    @loc = Location.find_by(city: params[:city].downcase)
    @guides = @loc.guides
  end

  def guided_locations
    @guided_locations = []
    guides = User.where(guide: true)

    guides.all.each do |guide|
        location = guide.location
        @guided_locations << location
    end
  end
end
