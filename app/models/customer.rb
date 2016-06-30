class Customer < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: [:slugged, :history]
  has_paper_trail

  validates :name, presence: true

  has_many :visits
  has_many :holds
  has_many :purchases

  def current_visit
    visits.ongoing.first
  end

  def latest_visit
    visits.order('arrived_at desc').first
  end

  def total_work_trade_duration
    visits.work_trade.total_duration
  end

  def total_purchases_cost
    purchases.total_cost
  end
end
