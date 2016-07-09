ActiveAdmin.register Donation do
  decorate_with DonationDecorator

  menu priority: 4

  belongs_to :customer

  actions :all, except: [:show]
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
  end

  permit_params :description, :value, :customer_id
end
