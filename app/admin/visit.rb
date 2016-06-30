ActiveAdmin.register Visit do
  decorate_with VisitDecorator

  menu priority: 1

  belongs_to :customer

  config.batch_actions = false
  actions :all

  index download_links: false, title: proc { "#{@customer.name}'s visits" } do
    column :reason
    column :arrived_at
    column :departed_at
    column :duration
    column :is_worktrade
    actions
  end

  show title: :title do
    attributes_table do
      row :arrived_at
      row :departed_at
      row :reason
      row :is_worktrade
    end
    active_admin_comments
  end

  form title: 'Visit' do |f|
    inputs 'Details' do
      input :reason
      input :arrived_at, as: :date_time_picker, timepicker_options: {  minute_stepping: 15 }
      input :departed_at, as: :date_time_picker
      input :is_worktrade
    end
    actions
  end

  before_build do |visit|
    visit.arrived_at = Time.current
  end

  member_action :finish, method: :put do
    resource.update_attribute :departed_at, Time.current
    redirect_to :back, notice: "Visit finished"
  end

  action_item :finish, only: [:show, :edit] do
    link_to 'Finish', finish_admin_customer_visit_path(id: resource.id), method: :put if resource.departed_at.nil?
  end

  permit_params :reason, :arrived_at, :departed_at, :is_worktrade

  config.batch_actions = false
end
