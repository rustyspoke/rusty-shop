ActiveAdmin.register CurrentHold do
  decorate_with HoldDecorator

  menu priority: 3

  index download_links: false do
    column :customer_name
    column :kind
    column :description
    column :tag
    actions
  end
end
