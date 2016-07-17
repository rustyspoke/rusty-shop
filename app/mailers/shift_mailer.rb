class ShiftMailer < ActionMailer::Base
  default to: 'internal@rustyspoke.org', from: 'shop@rustyspoke.org'

  def close_shop(shift)
    @visits = VisitsDecorator.decorate shift.visits
    @shift = ShiftDecorator.decorate shift

    mail subject: "#{@shift.date} shift report"
  end
end
