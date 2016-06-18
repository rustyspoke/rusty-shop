module ApplicationHelper
  def format_duration(duration)
    Time.at(duration).utc.strftime('%H:%M:%S')
  end
end
