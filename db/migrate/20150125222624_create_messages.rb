class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.datetime :wrote_at
      t.references :creator
      t.references :messageable, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_index :messages, :messageable_id
  end
end
