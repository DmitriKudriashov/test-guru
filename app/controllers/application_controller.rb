# frozen_string_literal: true

class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?

  def set_request_page
    session[:request_page] = request.fullpath if request.get?
  end

  private

  def authenticate_user!
    redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please!' unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
