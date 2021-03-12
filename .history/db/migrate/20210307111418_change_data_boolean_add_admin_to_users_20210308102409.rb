class ChangeDataBooleanAddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    User.update_all(admin: false)
    change_column :users, :admin, null: false, default: false
  end
end
