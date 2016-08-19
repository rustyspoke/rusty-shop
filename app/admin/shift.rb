ActiveAdmin.register Shift do
  decorate_with ShiftDecorator

  menu priority: 0

  config.sort_order = 'beginning_at_desc'

  index do
    column :beginning_at
    column :ending_at
    actions
  end

  show do
    attributes_table do
      row :beginning_at
      row :ending_at
    end
    active_admin_comments
  end

  form do |f|
    inputs 'Details' do
    end
    actions
  end

  actions :all, except: [:destroy, :create]

  config.batch_actions = false
end
