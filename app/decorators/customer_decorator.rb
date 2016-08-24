class CustomerDecorator < Draper::Decorator
  delegate_all
  decorates_association :visits

  def name
    object.name
  end

  def title
    name
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

  def latest_visit_date
    return 'None' unless object.latest_visit

    date = object.latest_visit.date
    date == Date.current ? 'Today' : h.l(date)
  end

  def work_trade(third_person = true)
    negative = object.work_trade.negative?
    "#{work_trade_verb third_person, negative}  #{object.work_trade.format('%h %~h and %m %~m')}"
  end

  def work_trade_verb(third_person, is_negative)
    if third_person
      is_negative ? 'Owes' : 'Has'
    else
      is_negative ? 'Owe' : 'Have'
    end
  end

end
