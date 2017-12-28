ActiveAdmin.register AdminUser, as: 'User' do
  filter :name

  actions :all, except: [:show, :destroy]
  config.batch_actions = false

  index do
    column :name
    actions do |admin_user|
      if admin_user.hidden
        link_to 'Unhide', unhide_admin_user_path(admin_user), method: :put
      else
        link_to 'Hide', hide_admin_user_path(admin_user), method: :put
      end
    end
  end

  form do |f|
    inputs 'Details' do
      input :name, required: true
      input :email
    end
    actions
  end

  permit_params :name, :email

  member_action :hide, method: :put do
    resource.update hidden: true
    redirect_to admin_users_path
  end

  member_action :unhide, method: :put do
    resource.update hidden: false
    redirect_to admin_users_path
  end
end
