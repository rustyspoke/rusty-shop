class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order(:name).decorate
  end
end
