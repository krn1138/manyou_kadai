class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string "name"
      t.text "note", null: false
      t.integer "status"

      t.timestamps
    end
    add_index :tasks, [:name, :status]
    add_index :tasks, :name
  end
end
