class Purchase < ActiveRecord::Base
  TIME_PARTS = %I(hours minutes seconds).freeze

  belongs_to :customer
  has_paper_trail

  monetize :cost_cash_cents, allow_nil: true
  monetize :cost_square_cents, allow_nil: true

  def self.total_cost_hours
    Duration.new seconds: sum('extract(epoch from cost_hours)').to_f
  end

  def cost_hours
    cost_string = read_attribute :cost_hours
    return nil if cost_string.nil?
    Duration.new Hash[TIME_PARTS.zip cost_string.split(':')]
  end

  def cost_hours=(cost)
    super(cost.present? ? cost : 0.seconds)
  end
end
