class SearchResultLocation < ActiveRecord::Base
  validates :search_result, presence: true
  validates :location, presence: true
end
