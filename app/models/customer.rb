class Customer < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: [:slugged, :history]
  has_paper_trail

  validates :name, presence: true

  has_many :visits
  has_many :holds
  has_many :purchases
  has_many :donations

  def current_visit
    visits.ongoing.first
  end

  def latest_visit
    visits.order('arrived_at desc').first
  end

  def total_work_trade_duration
    visits.work_trade.total_duration
  end

  def total_purchases_cost_hours
    purchases.total_cost_hours
  end

  def work_trade
    total_work_trade_duration - total_purchases_cost_hours
  end
end
