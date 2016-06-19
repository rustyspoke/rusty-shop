ActiveAdmin.register Hold do
  decorate_with HoldDecorator

  belongs_to :customer
  config.batch_actions = false
  actions :all, except: [:destroy]

  index download_links: false do
    column :kind
    column :description
    column :tag
    column :status
    actions
  end

  show do
    attributes_table do
      row :kind
      row :description
      row :tag
      row :status
    end

    active_admin_comments
  end

  form title: 'Hold item' do |f|
    inputs 'Details' do
      input :kind, as: :select, collection: %w(Bike Part), include_blank: false
      input :tag
      input :description
    end
    actions
  end

  member_action :claim, method: :put do
    resource.update_attribute :claimed_at, Time.current
    new_purchase = {customer: resource.customer, description: resource.description}
    redirect_to new_admin_customer_purchase_path(purchase: new_purchase)
  end

  action_item :claim, only: [:show, :edit]  do
    link_to 'Customer claimed', claim_admin_customer_hold_path(id: hold.id), method: :put
  end

  member_action :release, method: :put do
    resource.update_attribute :released_at, Time.current
    redirect_to admin_customer_holds_path(id: resource.id)
  end

  action_item :release, only: [:show, :edit] do
    link_to 'Release back', release_admin_customer_hold_path(id: hold.id), method: :put
  end

  permit_params :kind, :tag, :description
end
