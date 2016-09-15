class HoldDecorator < Draper::Decorator
  delegate_all

  delegate :name, to: :customer, prefix: true

  def title
    "#{customer_name}'s hold (#{object.description})"
  end

  def name
    "#{object.description} (#{object.tag})"
  end

  def status
    if claimed_at.present?
      "Claimed on #{h.l Time.parse(claimed_at).to_date, format: :short}"
    elsif released_at.present?
      "Released on #{h.l Time.parse(released_at).to_date, format: :short}"
    else
      "Held since #{h.l created_at.to_date, format: :short}"
    end
  end
end
