class SearchResult < ActiveRecord::Base
  validates :user, prescence: true
  validates :budget, prescence: true
  validates :start_at, prescence: true
  validates :end_at, prescence: true
end
