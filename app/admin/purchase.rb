ActiveAdmin.register Purchase do
  decorate_with PurchaseDecorator

  menu priority: 3

  belongs_to :customer
  config.batch_actions = false

  form title: 'Visit' do |f|
    panel 'Work trade available' do
      f.object.customer.decorate.work_trade_available
    end

    inputs 'Details' do
      input :description
      input :cost_dollars, label: '$'
      input :cost_hours, label: 'Hours used'
    end
    actions
  end

  index download_links: false, title: proc { "#{@customer.name}'s purchases" } do
    column :description
    column :cost_hours
    column :cost_dollars
    actions
  end

  show do
    attributes_table do
      row :description
      row :cost_dollars
      row :cost_hours
    end
  end

  permit_params :cost_dollars, :cost_hours, :description
end

