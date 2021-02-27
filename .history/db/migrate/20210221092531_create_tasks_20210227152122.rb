class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string "name"
      t.text "note", null: false

      t.timestamps
    end
    add_index :task, [:name, :status]
    add_index :name
  end
end
