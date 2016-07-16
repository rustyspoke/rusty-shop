class ShiftVisit < ActiveRecord::Base
  self.table_name = 'shifts_visits'

  belongs_to :shift
  belongs_to :visit

  private

  def readonly?
    true
  end
end
