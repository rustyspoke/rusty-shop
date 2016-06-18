class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :customer, null: false
      t.string :description, null: false
      t.column :cost, :interval, null: false
    end
  end
end
