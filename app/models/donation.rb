class Donation < ActiveRecord::Base
  belongs_to :customer

  monetize :value_cents
end
