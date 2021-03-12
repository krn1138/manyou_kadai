class ChangeDataBooleanAddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :admin, :boolean, :boolean, null: false
  end
end
