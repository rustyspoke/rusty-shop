ActiveAdmin.register_page 'Log' do
  menu priority: 100

  content do
    section "Recently updated content" do
      table_for PaperTrail::Version.order('id desc').limit(20) do # Use PaperTrail::Version if this throws an error
        column ("Item") { |v| v.item.try(:decorate).try :title }
        column ("Type") { |v| v.item_type.underscore.humanize }
        column ("Modified at") { |v| v.created_at.to_s :long }
        column ("Admin") { |v| v.whodunnit ? AdminUser.find(v.whodunnit).name : nil }
      end
    end
  end
end
