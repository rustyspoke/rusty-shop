module ApplicationHelper
  # https://github.com/activeadmin/activeadmin/issues/2874#issuecomment-32522163
  def arbre(&block)
    Arbre::Context.new(&block).to_s
  end
end
