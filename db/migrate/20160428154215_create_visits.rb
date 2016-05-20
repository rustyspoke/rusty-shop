class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :customer
      t.string :slug
      t.string :reason
      t.timestamps null: false
    end
  end
end
