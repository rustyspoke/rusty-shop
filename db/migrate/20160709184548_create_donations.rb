class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :customer,  null: false
      t.text :description, null: false
      t.integer :value_cents

      t.timestamps null: false
    end
  end
end
