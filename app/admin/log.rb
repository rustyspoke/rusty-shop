ActiveAdmin.register_page 'Log' do
  menu priority: 100

  content do
    section "Recently updated content" do
      table_for PaperTrail::Version.order('id desc').limit(20) do # Use PaperTrail::Version if this throws an error
        column ("Item") do |v|
          begin
            #v.item.try(:decorate).try :title
            v.item.decorate.title
          rescue
            nil
          end
        end
        column ("What") { |v| "#{v.event} #{v.item_type.downcase}"}
        column ("At") { |v| v.created_at.to_s :long }
        column ("Who") { |v| v.whodunnit ? AdminUser.find(v.whodunnit).name : nil }
      end
    end
  end
end
