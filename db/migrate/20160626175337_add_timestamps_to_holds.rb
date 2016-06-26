class AddTimestampsToHolds < ActiveRecord::Migration
  def self.up
    change_table :holds do |t|
      t.timestamps
    end
  end
  def self.down
    remove_column :holds, :created_at
    remove_column :holds, :updated_at
  end
end
