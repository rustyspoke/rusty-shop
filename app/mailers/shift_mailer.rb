class ShiftMailer < ActionMailer::Base
  add_template_helper ApplicationHelper

  default to: Proc.new { AdminUser.pluck(:email) }, from: 'internal@rustyspoke.org'

  def close_shop(shift)
    @visits = VisitsDecorator.decorate shift.visits
    @shift = ShiftDecorator.decorate shift
    @comments = CommentDecorator.for_shift shift

    mail subject: "#{@shift.date} shift report"
  end
end
