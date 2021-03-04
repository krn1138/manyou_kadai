class AddTimeLimitToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :limit, :date, :null => false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
