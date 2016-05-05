class Customer < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :visits
end
