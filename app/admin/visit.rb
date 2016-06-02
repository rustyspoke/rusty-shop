ActiveAdmin.register Visit do
  include ActiveAdmin::AjaxFilter
  decorate_with VisitDecorator

  belongs_to :customer

  index download_links: false, title: proc { "#{@customer.name}'s visits" } do
    column :reason
    column :arrived_at
    column :departed_at
    actions
  end

  show title: :title do
      attributes_table do
        row :arrived_at
        row :departed_at
        row :reason
      end
      active_admin_comments
    end

  form title: 'Visit' do |f|
    inputs 'Details' do
      input :customer
      input :reason
      input :arrived_at, as: :time_picker
      input :departed_at, as: :time_picker
    end
    actions
  end

  member_action :finish, method: :put do
    resource.update_attribute :departed_at, Time.current
    redirect_to resource_path, notice: "Visit finished"
  end

  actions :all, except: [:destroy]

  action_item :finish, only: [:show, :edit] do
    link_to 'Finish', finish_admin_customer_visit_path(id: resource.id), method: :put if resource.departed_at.nil?
  end

  permit_params :reason

  config.batch_actions = false
end
