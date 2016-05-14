class CustomersDecorator < Draper::CollectionDecorator
  def options_for_select
    object.map { |c| [c.name, c.slug ] }
  end
end
