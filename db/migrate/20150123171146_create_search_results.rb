class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.references :user
      t.integer    :budget
      t.datetime   :start_at
      t.boolean    :visible, :default => false

      t.timestamps :null => false
    end
  end
end
