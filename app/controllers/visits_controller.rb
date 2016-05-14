class VisitsController < ApplicationController

  def new
    @new_visit = Visit.new
    @customers = CustomersDecorator.decorate Customer.all
  end

  def create
    visit = Visit.create reason: params[:reason], customer: find_or_create_customer
    redirect_to visit
  end

  def show
    @visit = Visit.find(params[:id]).decorate
  end

  private

  def find_or_create_customer
    customer = Customer.find_by id: visit_params[:customer_id]

    return customer if customer.present?

    Customer.create name: visit_params[:customer_id]
  end

  def visit_params
    params[:visit].permit :customer_id
  end

end
