class Visit < ActiveRecord::Base
  extend FriendlyId

  friendly_id :generate_slug, use: :slugged

  belongs_to :customer

  def generate_slug
    Time.current.in_time_zone('Arizona').strftime '%y-%m-%d_%H:%M'
  end
end
