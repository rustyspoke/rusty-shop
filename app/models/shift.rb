require 'tod/core_extensions'
class Shift < ActiveRecord::Base
  has_and_belongs_to_many :admin_users
  has_and_belongs_to_many :visits

  after_create :enqueue_close_shop

  def self.current
    wday_shifts = {
      6 => Tod::Shift.new(Tod::TimeOfDay.new(12), Tod::TimeOfDay.new(20)),
      0 => Tod::Shift.new(Tod::TimeOfDay.new(12), Tod::TimeOfDay.new(15)),
      3 => Tod::Shift.new(Tod::TimeOfDay.new(17), Tod::TimeOfDay.new(20))
    }

    curr_wday = Date.current.wday

    hours = wday_shifts[curr_wday]
    return nil unless hours.present?

    hours.include? DateTime.now.to_time_of_day

    today = Date.current
    self.find_or_create_by beginning_at: hours.beginning.on(today), ending_at: hours.ending.on(today)
  end

  private

  def enqueue_close_shop
    Delayed::Job.enqueue CloseShopJob.new(self.id), run_at: ending_at
  end
end
