class CloseShopJob
  def perform
    end_ongoing_visits
    schedule_next_closing
  end

  private

  def end_ongoing_visits
    Visit.ongoing.each(&:end_now)
  end

  def schedule_next_closing
    Delayed::Job.enqueue CloseShopJob.new, run_at: next_closing
  end

  def next_closing
    closings = [[0, 15.hours], [3, 20.hours]]
    curr_wday = Date.current.wday
    next_wday, next_time = closings.find { |closing| closing.first !=  curr_wday }

    days_til_next = (next_wday - curr_wday) % 7
    Date.current + days_til_next + next_time
  end
end
