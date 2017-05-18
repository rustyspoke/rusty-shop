class AddHiddenToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :hidden, :boolean, default: false
  end
end
