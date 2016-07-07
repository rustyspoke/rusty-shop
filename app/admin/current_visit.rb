ActiveAdmin.register CurrentVisit do
  decorate_with VisitDecorator

  menu priority: 2

  config.batch_actions = false
  actions :all, except: [:new]

  index download_links: false do
    column :customer_name
    column :reason
    column :arrived_at
    column :duration
    column :is_worktrade
    column :toolbox

    actions defaults: false do |visit|
      item 'Finish', finish_admin_customer_visit_path(customer_id: visit.customer_id, id: visit.id), method: :put
      span ' or '
      item 'edit', edit_admin_customer_visit_path(customer_id: visit.customer_id, id: visit.id)
    end
  end
end
