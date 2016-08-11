class TimestampsToPurchase < ActiveRecord::Migration
  def change
    add_timestamps :purchases
  end
end
