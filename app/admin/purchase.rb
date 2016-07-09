ActiveAdmin.register Purchase do
  menu priority: 3

  belongs_to :customer
  config.batch_actions = false

  form title: 'Visit' do |f|
    panel 'Work trade available' do
      f.object.customer.decorate.work_trade_available
    end

    inputs 'Details' do
      input :description
      input :cost, label: 'Hours used'
    end
    actions
  end

  permit_params :cost, :description
end

