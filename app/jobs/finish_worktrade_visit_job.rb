FinishWorktradeVisitJob = Struct.new(:visit_id) do
  def perform
    send_receipt
  end

  private

  def send_receipt
    return unless ENV['SEND_WORKTRADE_RECEIPTS'].present?

    if visit.customer.phone.present?
      VisitTexter.worktrade_receipt(visit)
    elsif visit.customer.email.present?
      VisitMailer.worktrade_receipt(visit).deliver_now
    end
  end

  def visit
    @visit ||= Visit.find visit_id
  end
end
