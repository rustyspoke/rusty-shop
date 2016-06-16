class AddIsWorktradeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :is_worktrade, :boolean, null: false, default: false
  end
end
