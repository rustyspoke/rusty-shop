ActiveAdmin.register Customer do
  decorate_with CustomerDecorator

  menu priority: 1

  filter :name, as: :ajax_select, data: { search_fields: [:name], limit: 7 }

  index download_links: false do
    column 'Name' do |customer|
      link_to customer.name, admin_customer_path(customer)
    end

    actions defaults: false do |customer|
      if customer.current_visit.present?
        link_to 'Edit current visit', edit_admin_customer_visit_path(customer_id: customer.id, id: customer.current_visit.id)
      else
        link_to 'New visit', new_admin_customer_visit_path(customer_id: customer.id)
      end
    end
  end

  show do
    attributes_table do
      row :latest_visit
      row :work_trade_available
    end
    active_admin_comments
  end

  form title: 'Customer' do |f|
    inputs 'Details' do
      input :name
      input :email
      input :phone
    end
    actions
  end

  sidebar "Details", only: [:show, :edit] do
    ul do
      li link_to "Visits",    admin_customer_visits_path(customer)
      li link_to "Holds",    admin_customer_holds_path(customer)
      li link_to "Purchases",    admin_customer_purchases_path(customer)
    end
  end

  actions :all, except: [:destroy]

  permit_params :name, :email, :phone

  config.batch_actions = false

  controller do
    def create
      super do |format|
        redirect_to admin_customer_visits_path(resource) and return if resource.valid?
      end
    end
  end
end
