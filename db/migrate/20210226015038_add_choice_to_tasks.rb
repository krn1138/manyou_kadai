class AddChoiceToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :choice, :integer
  end
end
