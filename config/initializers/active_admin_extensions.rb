module ActiveAdmin
  module PaperTrail
    extend ActiveSupport::Concern

    included do
      before_filter :set_paper_trail_whodunnit
      before_filter :user_for_paper_trail
      before_filter :log_to_shift
    end

    def user_for_paper_trail
      current_admin_user.try :id
    end

    def log_to_shift
      current_shift = Shift.current
      if current_shift.present?
        unless current_shift.admin_users.include? current_admin_user
          current_shift.admin_users << current_admin_user
          flash[:info] = 'You are now marked as present during this shift'
        end
      else
        flash[:info] = 'Not currently in shop hours'
      end

    end
  end
end

ActiveAdmin::BaseController.send(:include, ActiveAdmin::PaperTrail)
