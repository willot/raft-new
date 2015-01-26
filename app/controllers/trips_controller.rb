class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy, :edit]

  def index
    if current_user
      @created_trips = current_user.created_trips
      @joined_trips = current_user.trips
    else
      @trips = Trip.order(:start_at).limit(25)
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    p @trip
    if @trip.save
      redirect_to  @trip
    else
      redirect_to '/'
    end
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:origin_id, :destination_id, :start_at, :end_at)
    end
end
