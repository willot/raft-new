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
          coordinates: [location.lng, location.lat]
        },
        properties: {
          title: "<a href='/guides/location.city.capitalize,
          description: "Guides Available: #{location.guides.count}" ,
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
