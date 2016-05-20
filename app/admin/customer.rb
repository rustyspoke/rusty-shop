ActiveAdmin.register Customer do

  menu priority: 1

  filter :name, as: :ajax_select, data: { search_fields: [:name], limit: 7 }

  index download_links: false do
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

  permit_params :name, :email, :phone

  config.batch_actions = false
end
