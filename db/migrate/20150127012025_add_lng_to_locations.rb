class AddLngToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :lng, :float
  end
end
