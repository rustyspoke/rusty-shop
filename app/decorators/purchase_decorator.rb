class PurchaseDecorator < Draper::Decorator
  delegate_all

  def purchased_at
    return nil unless object.created_at.present?
    h.l object.created_at, format: :short
  end

  def name
    "Purchase of #{object.description}"
  end

  def cost_dollars
    return nil unless object.cost_cents.to_i > 0
    h.number_to_currency object.cost_dollars
  end

  def cost_hours
    return nil if object.cost_hours == '00:00:00'
    object.cost_hours
  end
end


