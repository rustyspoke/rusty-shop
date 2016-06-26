ActiveAdmin.register CurrentHold do
  decorate_with HoldDecorator

  menu priority: 3
  config.batch_actions = false
  actions :all, except: [:destroy]

  index download_links: false do
    column :customer_name
    column :kind
    column :description
    column :tag
    actions defaults: false do |hold|
      item 'View', admin_customer_hold_path(customer_id: hold.customer_id, id: hold.id)
      span 'or'
      item 'Edit', edit_admin_customer_hold_path(customer_id: hold.customer_id, id: hold.id)
    end
  end
end
