class CloseShopJob
  def perform
    end_ongoing_visits
  end

  private

  def end_ongoing_visits
    Visit.ongoing.each(&:end_now)
  end
end
