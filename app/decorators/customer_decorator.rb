class CustomerDecorator < Draper::Decorator
  delegate_all
  decorates_association :visits

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

  def work_trade_available
    return nil unless object.visits.work_trade.present?
    available = total_work_trade_duration
    suffix = object.current_visit ? 'ongoing' : "last on #{h.l(object.latest_visit.arrived_at.to_date)}"

    "#{Time.at(available).utc.strftime('%H:%M:%S')} (#{suffix})"
  end

end
