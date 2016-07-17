FinishWorktradeVisitJob = Struct.new(:visit_id) do
  def perform
    VisitMailer.worktrade_receipt(visit).deliver_now
  end

  private

  def visit
    @visit ||= Visit.find visit_id
  end
end
