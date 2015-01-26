require 'momondo/client.rb'

class SearchResultsController < ApplicationController
  before_action :set_user_results, only: [:user_index]
  before_action :set_result, only: [:show]

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

  def save_result
    @user = current_user
    @search = SearchResult.new(params[:results])
    @search.user_id = @user.id
    if @search.save
      redirect_to 'search_results/#{@search.id}'
    else
      redirect_to "/"
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
end

