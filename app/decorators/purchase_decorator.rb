class PurchaseDecorator < Draper::Decorator
  delegate_all

  def purchased_at
    return nil unless object.created_at.present?
    h.l object.created_at, format: :short
  end

  def name
    "Purchase of #{object.description}"
  end

  def cost_cash
    h.number_to_currency object.cost_cash
  end

  def cost_square
    h.number_to_currency object.cost_square
  end

  def cost_hours
    return nil unless object.cost_hours.present?
    object.cost_hours.format '%h %~h and %m %~m'
  end
end


