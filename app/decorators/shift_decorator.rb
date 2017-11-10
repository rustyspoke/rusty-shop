class ShiftDecorator < Draper::Decorator
  delegate_all

  def name
    "#{beginning_at} shift"
  end

  def title
    "#{name} with #{staff_names}"
  end

  def date
    l object.beginning_at.to_date
  end

  def day_of_week
    object.beginning_at.strftime '%A'
  end

  def beginning_at
    "#{day_of_week} #{l object.beginning_at, format: :short}"
  end

  def ending_at
    "#{day_of_week} #{l object.ending_at, format: :short}"
  end

  def ending_at_time
    object.ending_at.strftime '%H:%M'
  end

  def beginning_float
    h.number_to_currency object.beginning_float
  end

  def ending_float
    h.number_to_currency object.ending_float
  end

  def staff_names
    object.admin_users.pluck(:name).to_sentence
  end

  def warnings
    return nil unless beginning_float_cents.nil?

    "Please set shift beginning cash float #{h.link_to 'here', h.admin_shift_path(object)}.".html_safe
  end
end
