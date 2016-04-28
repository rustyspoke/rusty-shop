class VisitsController < ApplicationController

  def new
    customer = Customer.find params[:customer_id]

    render html: (Arbre::Context.new do
      customer_present(customer: customer) do
        visits_new customer
      end
    end)
  end

end
