class Visit < ActiveRecord::Base
  extend FriendlyId
  has_paper_trail

  after_save :enqueue_finish_visit_job, if: :departed_at_changed?

  friendly_id :generate_slug, use: :slugged

  belongs_to :customer
  belongs_to :toolbox

  has_and_belongs_to_many :shifts

  validates :arrived_at, :reason, presence: true
  validate :only_one_ongoing, on: :create
  validate :only_one_toolbox, on: :create
  validate :depart_after_create

  def self.ongoing
    where departed_at: nil
  end

  def self.work_trade
    where is_worktrade: true
  end

  def self.total_duration
    Duration.new seconds: sum('extract(epoch from coalesce(departed_at, CURRENT_TIMESTAMP) - arrived_at)').to_f
  end

  def shop_closed
    return if departed_at.present?
    update_attributes departed_at: shifts.last.ending_at
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
    Duration.new seconds: ((departed_at || Time.current) - arrived_at)
  end

  private

  def only_one_ongoing
    errors.add :base, 'only one ongoing visit allowed' if customer.visits.ongoing.present?
  end

  def only_one_toolbox
    return if toolbox.nil?

    other_visit = Visit.ongoing.find_by toolbox: toolbox
    errors.add :toolbox, "is currently checked out by #{other_visit.customer.name}" if other_visit.present?
  end

  def depart_after_create
    is_impossible = (departed_at || Time.current) < arrived_at
    errors.add :departed_at, 'cannot be after arrived at' if is_impossible
  end

  def enqueue_finish_visit_job
    Delayed::Job.enqueue FinishWorktradeVisitJob.new(self.id) if is_worktrade?
  end
end
