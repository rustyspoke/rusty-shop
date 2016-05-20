class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :customer
      t.string :slug
      t.string :reason
      t.datetime :arrived_at
      t.datetime :departed_at
    end
  end
end
