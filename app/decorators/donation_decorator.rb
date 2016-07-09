class DonationDecorator < Draper::Decorator
  delegate_all

  def value
    h.number_to_currency object.value
  end
end

