class CustomerDecorator < Draper::Decorator
  def new_visit_link
    h.link_to object.name, h.new_customer_visit_path(object)
  end
end
