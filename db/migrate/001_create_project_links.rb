class CreateProjectLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :project_links do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :author_id, null: false
      t.integer :project_id, null: false
      t.timestamps
    end
  end
end
