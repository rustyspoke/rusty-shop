class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.datetime :beginning_at
      t.datetime :ending_at

      t.timestamps null: false
    end

    create_table :admin_users_shifts do |t|
      t.belongs_to :admin_user
      t.belongs_to :shift
    end
  end
end
