class Purchase < ActiveRecord::Base
  belongs_to :customer
  has_paper_trail

  def self.total_cost_hours
    sum('extract(epoch from cost_hours)').to_f.seconds
  end

  def cost_hours=(cost)
    super(cost.present? ? cost : 0.seconds)
  end

  def cost_cash_dollars=(cost)
    errors.add :cost_cash_dollars, "can't parse #{cost} as dollar value" unless cost.to_f
    self.cost_cash_cents = cost.to_f * 100.0
  end

  def cost_square_dollars=(cost)
    errors.add :cost_square_dollars, "can't parse #{cost} as dollar value" unless cost.to_f
    self.cost_square_cents = cost.to_f * 100.0
  end

  def cost_cash_dollars
    return nil unless cost_cash_cents.present?
    cost_cash_cents.to_f / 100.0
  end

  def cost_square_dollars
    return nil unless cost_square_cents.present?
    cost_square_cents.to_f / 100.0
  end
end
