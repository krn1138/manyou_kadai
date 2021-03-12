class ChangeDataBooleanAddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :admin, null: false, default: false
  end
end
