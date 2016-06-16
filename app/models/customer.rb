class Customer < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :visits

  def current_visit
    visits.ongoing.first
  end
end
