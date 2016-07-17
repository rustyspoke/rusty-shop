class ShiftDecorator < Draper::Decorator
  delegate_all

  def date
    l object.beginning_at.to_date
  end

  def staff_names
    object.admin_users.pluck(:name).to_sentence
  end
end
