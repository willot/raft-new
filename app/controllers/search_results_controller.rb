class SearchResultsController < ApplicationController
  def index
    @search_result = SearchResult.new
    @ip = request.ip
    @user_location = Location.new
    @city = @user_location.geo_locate(@ip)
  end

  def create
   @search_result = SearchResult.new(search_result_params)
  end

  private

  def search_result_params
   params.require(:search_result).permit(:current_city, :budget, :start_at, :end_at)
  end
end


