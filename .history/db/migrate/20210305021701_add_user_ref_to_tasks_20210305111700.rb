class AddUserRefToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :author, foreign_key: true
  end
end