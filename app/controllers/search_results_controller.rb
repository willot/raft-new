require 'momondo/client.rb'

class SearchResultsController < ApplicationController
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
   @client = Momondo::Client.new
   @results = @client.where_to_go(leave_date: '05/07/2015',leave_from: "LAX", max_price: @search_result.budget )

   render "search_results/index"
  end

  private

  def search_result_params
   params.require(:search_result).permit(:current_city, :budget, :start_at, :end_at)
  end
end


