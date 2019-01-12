# frozen_string_literal: true

class ApplicationController < ActionController::Base

  # before_action :goto_request_page
  # before_action :authenticate_user!
    # only: %i[answers_controller questions_controller test_passages_controller tests_controller]

  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  def goto_request_page
    session[:request_page] = request.fullpath if request.get?
  end

  private

  def authenticate_user!
    if current_user
      cookies[:email] = current_user&.email
    else
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
