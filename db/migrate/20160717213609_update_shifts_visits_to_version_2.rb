class UpdateShiftsVisitsToVersion2 < ActiveRecord::Migration
  def change
    update_view :shifts_visits, version: 2, revert_to_version: 1
  end
end
