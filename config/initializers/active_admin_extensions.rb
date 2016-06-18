module ActiveAdmin
  module PaperTrail
    extend ActiveSupport::Concern

    included do
      before_filter :set_paper_trail_whodunnit
      before_filter :user_for_paper_trail
    end

    def user_for_paper_trail
      current_admin_user.try :id
    end
  end
end

ActiveAdmin::BaseController.send(:include, ActiveAdmin::PaperTrail)
