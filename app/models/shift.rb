require 'tod/core_extensions'
class Shift < ActiveRecord::Base
  has_and_belongs_to_many :admin_users
  has_and_belongs_to_many :visits

  after_create :enqueue_close_shop

  monetize :beginning_float_cents, allow_nil: true
  monetize :ending_float_cents, allow_nil: true

  def self.current
    wday_shifts = {}

    if ENV['ON_SHIFT']
      (0..6).each do |wday|
        wday_shifts[wday] = Tod::Shift.new(Tod::TimeOfDay.new(9), Tod::TimeOfDay.new(23))
      end
    else
      wday_shifts[0] = Tod::Shift.new(Tod::TimeOfDay.new(12), Tod::TimeOfDay.new(15))
      wday_shifts[3] = Tod::Shift.new(Tod::TimeOfDay.new(17), Tod::TimeOfDay.new(20))
    end

    curr_wday = Date.current.wday

    hours = wday_shifts[curr_wday]
    return nil unless hours.present?

    hours.include? DateTime.now.to_time_of_day

    today = Date.current
    self.find_or_create_by beginning_at: hours.beginning.on(today), ending_at: hours.ending.on(today)
  end

  private

  def enqueue_close_shop
    Delayed::Job.enqueue CloseShopJob.new(self.id), run_at: (ending_at + 30.minutes)
  end
end
