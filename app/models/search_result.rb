class SearchResult < ActiveRecord::Base
  belongs_to :user
  has_many :search_result_locations
  has_many :locations, through: :search_result_locations

  validates :user, presence: true
  validates :budget, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
end
