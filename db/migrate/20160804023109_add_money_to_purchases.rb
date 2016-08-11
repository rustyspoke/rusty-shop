class AddMoneyToPurchases < ActiveRecord::Migration
  def change
    rename_column :purchases, :cost, :cost_hours
    change_column_null :purchases, :cost_hours, true
    add_column :purchases, :cost_cents, :integer
  end
end
