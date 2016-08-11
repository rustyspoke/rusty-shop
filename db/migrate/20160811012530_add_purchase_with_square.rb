class AddPurchaseWithSquare < ActiveRecord::Migration
  def change
    add_column :purchases, :cost_square_cents, :integer
    rename_column :purchases, :cost_cents, :cost_cash_cents
  end
end
