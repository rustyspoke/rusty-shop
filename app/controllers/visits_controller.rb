class VisitsController < ApplicationController

  def new
    @new_visit = Visit.new
    @customers = CustomersDecorator.decorate Customer.all
  end

  def create
    customer = find_or_create_customer
    is_new_customer = customer.new_record?

    visit = Visit.create reason: params[:reason], customer: customer
    redirect_to is_new_customer ? edit_customer_path(customer) : visit
  end

  def show
    @visit = Visit.find(params[:id]).decorate
  end

  private

  def find_or_create_customer
    Customer.find visit_params[:customer_id]
  rescue ActiveRecord::RecordNotFound
    Customer.new name: visit_params[:customer_id]
  end

  def visit_params
    params[:visit].permit :customer_id
  end
end
