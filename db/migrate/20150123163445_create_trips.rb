class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :origin
      t.references :destination
      t.datetime   :start_at
      t.datetime   :end_at
      t.text       :description
      t.references :user

      t.timestamps :null => false
    end
  end
end
