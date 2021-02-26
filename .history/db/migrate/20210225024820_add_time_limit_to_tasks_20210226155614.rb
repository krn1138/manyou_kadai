class AddTimeLimitToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :limit, :date, null: false, :default -> { Time.now + 7.days }
  end
end
