class SearchResult < ActiveRecord::Base
  validates :user, presence: true
  validates :budget, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
end
