class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :code
      t.references :location

      t.timestamps null: false
    end
  end
end
