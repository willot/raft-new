class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :age
      t.string :email
      t.string :password_digest
      t.text :bio
      t.boolean :guide, :default => false
      #references :location need to create locations table

      t.timestamps null: false
    end
  end
end
