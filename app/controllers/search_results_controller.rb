require 'momondo/client.rb'
require 'Date'

class SearchResultsController < ApplicationController
  before_action :set_search_result, only: [:user_index]

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
   @results = @client.where_to_go(leave_date: @search_result.start_at.to_s ,leave_from: airport_code, max_price: @search_result.budget )
   render "search_results/index"
  end

  private
  def set_search_result
    @results = current_user.search_results
  end

  def search_result_params
   params.require(:search_result).permit(:current_city, :budget, :start_at, :end_at)
  end

  def convert_city_to_airport(current_city)#this method convert the city into airport code
   Location.find_by(city: current_city).airports.first.code
  end
end

