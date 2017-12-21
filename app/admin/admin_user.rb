ActiveAdmin.register AdminUser do
  filter :name

  actions :all, except: [:show, :edit]

  index do
    column :name
    actions
  end

  form do |f|
    inputs 'Details' do
      input :name, required: true
      input :email
    end
    actions
  end

  permit_params :name, :email
end
