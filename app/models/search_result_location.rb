class SearchResultLocation < ActiveRecord::Base
  belongs_to :search_result
  belongs_to :location

  validates :search_result, presence: true
  validates :location, presence: true
end
