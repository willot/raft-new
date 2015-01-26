class SearchResult < ActiveRecord::Base
  belongs_to :user
  has_many :search_result_locations
  has_many :locations, through: :search_result_locations

  validates :budget, presence: true
  validates :start_at, presence: true
end
