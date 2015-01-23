class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.references :user
      t.integer    :budget
      t.datetime   :start_at
      t.datetime   :end_at

      t.timestamps :null => false
    end
  end
end
