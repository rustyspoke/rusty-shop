class VisitMailer < ActionMailer::Base
  add_template_helper ApplicationHelper

  default from: 'info@rustyspoke.org'

  def worktrade_receipt(visit)
    return unless visit.is_worktrade?

    @visit = VisitDecorator.decorate visit
    @customer = CustomerDecorator.decorate visit.customer

    mail to: @customer.email, subject: 'Work trade receipt from Rusty Spoke'
  end
end
