class SearchResultLocation < ActiveRecord::Base
  validates :search_result, prescence: true
  validates :location, prescence: true
end
