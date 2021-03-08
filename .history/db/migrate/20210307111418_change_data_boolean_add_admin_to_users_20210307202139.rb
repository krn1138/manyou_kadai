class ChangeDataBooleanAddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :boolean, :boolean, null: false
  end
end
