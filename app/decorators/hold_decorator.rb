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
      "<b>Claimed</b> on #{h.l Time.parse(claimed_at).to_date, format: :short}".html_safe
    elsif released_at.present?
      "<b>Released</b> on #{h.l Time.parse(released_at).to_date, format: :short}".html_safe
    else
      "Held since #{h.l created_at.to_date, format: :short}".html_safe
    end
  end
end
