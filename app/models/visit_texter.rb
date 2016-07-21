require 'twilio-ruby'

class VisitTexter
  def self.worktrade_receipt(visit)
    return unless visit.is_worktrade?

    @visit = VisitDecorator.decorate visit
    @customer = CustomerDecorator.decorate visit.customer

    client = Twilio::REST::Client.new

    our_number = ENV['TWILIO_NUMBER']
    their_number = visit.customer.phone
    client.messages.create from: our_number, to: their_number, body: <<-BODY.strip_heredoc
    Receipt for #{@visit.duration} worktrade at Rusty Spoke on #{@visit.date}.
    You have #{@customer.work_trade_available} total.
    Ask staff if incorrect.
    BODY
  end
end
