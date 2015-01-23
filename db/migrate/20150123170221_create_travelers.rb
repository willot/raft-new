class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.references :user
      t.references :trip

      t.timestamps :null => false
    end
  end
end
