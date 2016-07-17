class ShiftMailer < ActionMailer::Base
  add_template_helper ApplicationHelper

  default to: 'internal@rustyspoke.org', from: 'internal@rustyspoke.org'

  def close_shop(shift)
    @visits = VisitsDecorator.decorate shift.visits
    @shift = ShiftDecorator.decorate shift

    mail subject: "#{@shift.date} shift report"
  end
end
