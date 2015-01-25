class TripsController < ApplicationController
  before_action: :set_trip, only: [:show, :update, :destroy, :edit]

  def index
    if current_user
      @trips = current_user.trips
    else
      @trips = Trips.order().limit(25)
    end
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end
end
