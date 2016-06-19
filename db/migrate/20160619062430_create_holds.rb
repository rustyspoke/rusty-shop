class CreateHolds < ActiveRecord::Migration
  def change
    create_table :holds do |t|
      t.belongs_to :customer, null: false
      t.string :kind, null: false
      t.string :tag
      t.string :description
      t.string :claimed_at
      t.string :released_at
    end
  end
end
