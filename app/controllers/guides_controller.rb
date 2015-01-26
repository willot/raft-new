class GuidesController < ApplicationController
  def index
    @guides = User.where(guide: true)
  end

  def find_guides
    @loc = Location.find_by(city: params[:city].downcase)
    @guides = @loc.guides
  end
end
