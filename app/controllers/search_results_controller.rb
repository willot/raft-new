class SearchResultsController < ApplicationController
  def index
  end

  def new
  end

  def create
     @search_result = SearchResult.new
     @search_result.user_id = 1
   end
end
