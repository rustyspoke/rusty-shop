class Visit < ActiveRecord::Base
  extend FriendlyId
  has_paper_trail

  before_create :set_arrived_at

  friendly_id :generate_slug, use: :slugged

  belongs_to :customer
  belongs_to :toolbox

  validates :reason, presence: true
  validate :only_one_ongoing, on: :create
  validate :only_one_toolbox, on: :create

  def self.ongoing
    where departed_at: nil
  end

  def self.work_trade
    where is_worktrade: true
  end

  def self.total_duration
    sum('extract(epoch from coalesce(departed_at, CURRENT_TIMESTAMP) - arrived_at)').to_f.seconds
  end

  def end_now
    update_attributes departed_at: Time.current
  end

  def name
    date
  end

  def generate_slug
    Time.current.in_time_zone('Arizona').strftime '%y-%m-%d_%H:%M'
  end

  def date
    arrived_at.to_date
  end

  def duration
    ((departed_at || Time.current) - arrived_at).seconds
  end

  private

  def set_arrived_at
    self.arrived_at = Time.current
  end

  def only_one_ongoing
    errors.add :base, 'only one ongoing visit allowed' if customer.visits.ongoing.present?
  end

  def only_one_toolbox
    return if toolbox.nil?

    other_visit = Visit.ongoing.find_by toolbox: toolbox
    errors.add :toolbox, "is currently checked out by #{other_visit.customer.name}" if other_visit.present?
  end
end
