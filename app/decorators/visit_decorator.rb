class VisitDecorator < Draper::Decorator
  decorates_association :customer
  delegate_all

  def title
    arrived_at
  end

  def departed_at
    model.departed_at.present? ? l(object.departed_at, format: :short) : ''
  end

  def arrived_at
    l model.arrived_at, format: :short
  end
end
