ActiveAdmin.register Visit do
  include ActiveAdmin::AjaxFilter

  belongs_to :customer

  filter :customer, as: :ajax_select, data: { search_fields: [:name], limit: 7 }

  form title: 'Visit' do |f|
    inputs 'Details' do
      input :customer
      input :reason
    end
    actions
  end

  permit_params :reason
end
