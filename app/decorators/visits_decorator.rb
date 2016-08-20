class VisitsDecorator < Draper::CollectionDecorator
  def customer_names
    customers = object.includes(:customer).order('customers.name')
    customers.pluck('customers.name').uniq.to_sentence
  end

  def customer_count
    object.includes(:customer).count('distinct customer_id')
  end

  def work_trade
    object.work_trade.total_duration.format('%h %~h and %m %~m')
  end

  def worktrade_customer_names
    customers = object.work_trade.includes(:customer).order('customers.name')
    customers.pluck('customers.name').to_sentence
  end
end
