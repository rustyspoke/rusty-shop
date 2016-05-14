class CustomerDecorator < Draper::Decorator
  def name
    object.name
  end

  def to_param
    object.to_param
  end

  def new_visit_link
    h.link_to object.name, h.new_customer_visit_path(object)
  end

  def greeting
    new_today = object.created_at > 1.day.ago
    new_today ? "Glad to have you here #{ name }" : "Welcome back #{ name }"
  end
end
