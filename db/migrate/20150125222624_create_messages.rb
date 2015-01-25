class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.datetime :wrote_at
      t.references :creator
      t.references :recipient

      t.timestamps null: false
    end
  end
end
