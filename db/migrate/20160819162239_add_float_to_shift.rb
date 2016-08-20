class AddFloatToShift < ActiveRecord::Migration
  def change
    add_column :shifts, :beginning_float_cents, :integer
    add_column :shifts, :ending_float_cents, :integer
  end
end
