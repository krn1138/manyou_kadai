class AddTimeLimitToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :limit, :date, null: false, default: '2021-02-26'.to_date
  end
end
