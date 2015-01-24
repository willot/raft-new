class AddCurrentCityColumnToSearchResults < ActiveRecord::Migration
  def change
    add_column :search_results, :current_city, :string
  end
end
