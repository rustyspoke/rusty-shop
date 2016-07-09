class Donation < ActiveRecord::Base
  belongs_to :customer

  attr_accessor :value

  validate do
    return if value.blank?
    errors.add :value, "can't parse #{value} as dollar value" unless value.to_f
    self.value_cents = value.to_f * 100.0
  end

  def value
    value_cents / 100.0
  end
end
