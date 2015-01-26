require 'momondo/client.rb'

class SearchResultsController < ApplicationController
  before_action :set_user_results, only: [:user_index]
  before_action :set_result, only: [:show]

  # autocomplete :location, :city, :full => true

  def autocomplete_location_city
    cities = Location.where("city ILIKE ?", "%#{params[:term]}%").pluck(:city)
    render :json => cities
  end

  def index
  end

  def new
    @search_result = SearchResult.new
    @ip = request.ip
    @user_location = Location.new
    @city = @user_location.geo_locate(@ip)
  end

  def create
    @search_result = SearchResult.new(search_result_params)
    airport_code = convert_city_to_airport(@search_result.current_city.downcase)
    @client = Momondo::Client.new
    @results = @client.where_to_go(leave_date: @search_result.start_at.to_s ,leave_from: airport_code, max_price: @search_result.budget)

    if current_user
      @search_result.user_id = current_user.id
    end

    if @search_result.save
      @results.each do |result|
        @converted_location_city = convert_airport_to_city(result.destination)
        @location = Location.find_by(city: @converted_location_city)
        @search_location = SearchResultLocation.new(location_id: @location.id, search_result_id: @search_result.id)
        @search_location.save
      end
     render "search_results/index"
    else
      redirect_to '/'
    end
  end

  def save_result
    @search = SearchResult.find(params[:search])
    @search.visible = true

    if @search.save
      redirect_to 'search_results/#{@search.id}'
    else
      redirect_to '/'
    end
  end

  private
  def set_user_results
    @results = current_user.search_results
  end

  def set_result
    @result = SearchResult.find(params[:id])
  end

  def search_result_params
   params.require(:search_result).permit(:current_city, :budget, :start_at, :end_at)
  end

  def convert_city_to_airport(current_city)#this method convert the city into airport code
   Location.find_by(city: current_city).airports.first.code
  end

  def convert_airport_to_city(code)
    if code != nil
    @destination = Airport.find_by(code: code).location.city
    end
  end
end

