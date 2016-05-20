class Visit < ActiveRecord::Base
  extend FriendlyId

  before_create :set_arrived_at

  friendly_id :generate_slug, use: :slugged

  belongs_to :customer

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

end
