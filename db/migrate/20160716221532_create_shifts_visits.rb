class CreateShiftsVisits < ActiveRecord::Migration
  def change
    create_view :shifts_visits
  end
end
