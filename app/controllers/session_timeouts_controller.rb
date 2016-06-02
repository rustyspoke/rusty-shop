class SessionTimeoutsController < ApplicationController
  # These are what prevent check_time_until_logout and
  # reset_user_clock from resetting users' Timeoutable
  # Devise "timers"
  prepend_before_action :skip_timeout, only: [:show]
  def skip_timeout
    request.env["devise.skip_trackable"] = true
  end

  skip_before_filter :authenticate_user!, only: [:has_user_timed_out]

  def show
    render json: {} and return unless admin_user_session.present? && admin_user_session

    last_request_at = admin_user_session['last_request_at']
    render json: {} and return unless last_request_at.present?

    since_last_request_at = Time.now.to_i - last_request_at
    render json: { time_left: Devise.timeout_in - since_last_request_at }
  end
end
