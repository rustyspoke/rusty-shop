ActiveAdmin.register Visit do
  include ActiveAdmin::AjaxFilter

  belongs_to :customer

  filter :customer, as: :ajax_select, data: { search_fields: [:name], limit: 7 }

  permit_params :reason

end
