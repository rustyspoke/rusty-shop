CloseShopJob = Struct.new(:shift_id) do
  def perform
    end_ongoing_visits

    ShiftMailer.close_shop(shift).deliver_now
  end

  private

  def shift
    @shift ||= Shift.find shift_id
  end

  def end_ongoing_visits
    Visit.ongoing.each(&:end_now)
  end
end
