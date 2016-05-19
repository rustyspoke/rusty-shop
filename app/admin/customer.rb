ActiveAdmin.register Customer do

  menu priority: 1

  index do
    column 'Name' do |customer|
      link_to customer.name, admin_customer_path(customer)
    end
    actions
  end

  form title: 'Customer' do |f|
    inputs 'Details' do
      input :name
      input :email
      input :phone
    end
    actions
  end

  actions :all, except: [:destroy]
  permit_params :name, :email, :phone

end
