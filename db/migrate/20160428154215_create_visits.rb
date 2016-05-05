class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :customer
      t.timestamps null: false
    end
  end
end
