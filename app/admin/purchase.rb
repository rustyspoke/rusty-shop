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
      input :cost_cash, label: '$ (cash)'
      input :cost_square, label: '$ (square)'
      input :cost_hours, label: 'Hours used'
    end
    actions
  end

  index download_links: false, title: proc { "#{@customer.name}'s purchases" } do
    column :purchased_at
    column :description
    column :cost_hours
    column :cost_cash
    column :cost_square
    actions
  end

  show do
    attributes_table do
      row :purchased_at
      row :description
      row :cost_cash
      row :cost_square
      row :cost_hours
    end
  end

  permit_params :cost_cash, :cost_square, :cost_hours, :description
end

