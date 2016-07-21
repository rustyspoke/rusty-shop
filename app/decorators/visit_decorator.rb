class VisitDecorator < Draper::Decorator
  decorates_association :customer
  delegate_all

  delegate :name, to: :customer, prefix: true

  def title
    "#{customer_name}'s #{date} visit (#{model.reason})"
  end

  def date
    l model.arrived_at.to_date, format: :short
  end

  def departed_at
    model.departed_at.present? ? l(object.departed_at, format: :short) : ''
  end

  def arrived_at
    l model.arrived_at, format: :short
  end

  def duration
    h.format_duration model.duration
  end

  def toolbox
    toolbox = model.toolbox
    return nil unless toolbox.present?

    h.arbre do
      span class: 'status_tag', style: "background:#{toolbox.name}" do
        toolbox.name
      end
    end
  end
end
