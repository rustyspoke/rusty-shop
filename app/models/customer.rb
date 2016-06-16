class Customer < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :visits

  def current_visit
    visits.ongoing.first
  end

  def latest_visit
    visits.order('arrived_at desc').first
  end

  def total_work_trade_duration
    visits.work_trade.total_duration
  end
end
