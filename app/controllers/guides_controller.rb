class GuidesController < ApplicationController
  before_action :guided_locations, only: [:index]

  def index
    @guides = User.where(guide: true)

    #For Mapbox
    @geojson = Array.new
    @guided_locations.each do |location|
      #type key, geometry key & property key required
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinate: [41.8369, -87.6847] #[location.lg(location.city), location.latitude(location.city)]
        },
        properties: {
          name: location.city,
          available_guides: location.guides.count,
          :'marker-color' => '##f86767',
          :'marker-symbol' => 'marker',
          :'marker-size' => 'large'
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
    Location.all.each do |location|
      if location.guides.count != 0
        @guided_locations << location
      end
    end
  end
end
