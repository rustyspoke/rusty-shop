class DonationDecorator < Draper::Decorator
  delegate_all

  def name
    "#{value} donation on #{date}"
  end

  def date
    l created_at.to_date, format: :short
  end

  def value
    h.number_to_currency object.value
  end
end

