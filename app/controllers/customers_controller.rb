class CustomersController < ApplicationController

  def index
    customers = Customer.all.order(:name).decorate

    render html: (Arbre::Context.new do
      public do
        customers_index customers
      end
    end)
  end

end
