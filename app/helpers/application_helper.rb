module ApplicationHelper
  def format_duration(duration)
    Time.at(duration).utc.strftime('%H hrs %M mins')
  end

  # https://github.com/activeadmin/activeadmin/issues/2874#issuecomment-32522163
  def arbre(&block)
    Arbre::Context.new(&block).to_s
  end
end
