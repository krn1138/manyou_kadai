class AddDayToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :day, :date
  end
end
