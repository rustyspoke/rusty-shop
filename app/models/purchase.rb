class Purchase < ActiveRecord::Base
  belongs_to :customer
  has_paper_trail

  monetize :cost_cash_cents
  monetize :cost_square_cents

  def self.total_cost_hours
    sum('extract(epoch from cost_hours)').to_f.seconds
  end

  def cost_hours=(cost)
    super(cost.present? ? cost : 0.seconds)
  end
end
