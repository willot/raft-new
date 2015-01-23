class CreateSearchResultLocations < ActiveRecord::Migration
  def change
    create_table :search_result_locations do |t|
      t.references :search_result
      t.references :location

      t.timestamps :null => false
    end
  end
end
