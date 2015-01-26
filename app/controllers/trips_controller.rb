class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy, :edit]

  def index
    if current_user
      @trips = current_user.trips
    else
      @trips = Trip.order(:start_at).limit(25)
    end
  end

  def create
    @trip = Trip.new(params[:results])
    @trip.user_id = current_user.id
    if @trip.save
      redirect 'trips/#{@trip.id}'
    else
      redirect_to '/'
    end
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end
end
