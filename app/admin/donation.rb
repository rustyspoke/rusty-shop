ActiveAdmin.register Donation do
  decorate_with DonationDecorator

  menu priority: 4

  belongs_to :customer

  actions :all
  config.batch_actions = false

  form title: 'Donation' do |f|
    inputs 'Details' do
      input :description
      input :value, label: 'Value ($)'
    end
    actions
  end

  index do
    column :created_at
    column :description
    column :value
    actions
  end

  show do
    attributes_table do
      row :created_at
      row :description
      row :value
    end

    active_admin_comments
  end

  permit_params :description, :value, :customer_id
end
