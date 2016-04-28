module Customers
  class Index < Arbre::Component
    builder_method :customers_index

    def build(customers, attributes = {})
      super attributes

      ul do
        customers.each do |customer|
          li customer.new_visit_link
        end
      end
    end
  end
end
