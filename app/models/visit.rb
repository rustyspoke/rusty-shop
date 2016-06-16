class Visit < ActiveRecord::Base
  extend FriendlyId

  before_create :set_arrived_at

  friendly_id :generate_slug, use: :slugged

  belongs_to :customer

  validate :only_one_ongoing, on: :create

  def self.ongoing
    where departed_at: nil
  end

  def self.work_trade
    where is_worktrade: true
  end

  def self.total_duration
    sum('extract(epoch from coalesce(departed_at, CURRENT_TIMESTAMP) - arrived_at)').to_f.seconds
  end

  def generate_slug
    Time.current.in_time_zone('Arizona').strftime '%y-%m-%d_%H:%M'
  end

  def duration
    departed_at - arrived_at
  end

  private

  def set_arrived_at
    self.arrived_at = Time.current
  end

  def only_one_ongoing
    errors.add :base, 'only one ongoing visit allowed' if customer.visits.ongoing.present?
  end
end
