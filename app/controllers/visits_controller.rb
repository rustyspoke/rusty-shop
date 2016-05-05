class VisitsController < ApplicationController

  def new
    @customer = Customer.find params[:customer_id]
  end

end
