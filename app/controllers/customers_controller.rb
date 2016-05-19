class CustomersController < ApplicationController
  def edit
    @customer = Customer.find params[:id]
  end

  def update
    customer = Customer.find params[:id]
    customer.update customer_params

    redirect_to customer.visits.last
  end

  private

  def customer_params
    params.require(:customer).permit :phone, :email
  end
end
