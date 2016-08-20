ActiveAdmin.register Shift do
  decorate_with ShiftDecorator

  menu priority: 0

  config.sort_order = 'beginning_at_desc'

  index do
    column :beginning_at
    column :ending_at
    column :beginning_float
    column :ending_float
    actions
  end

  show do
    attributes_table do
      row :beginning_at
      row :ending_at
      row :beginning_float
      row :ending_float
    end
    active_admin_comments
  end

  form do |f|
    inputs 'Details' do
      input :beginning_float, label: 'Beginning float ($)'
      input :ending_float, label: 'Ending float ($)'
    end
    actions
  end

  actions :all, except: [:destroy, :create]

  config.batch_actions = false

  permit_params :beginning_float, :ending_float
end
