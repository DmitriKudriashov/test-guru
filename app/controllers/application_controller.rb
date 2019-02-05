# frozen_string_literal: true

class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :permitted_parameters, if: :devise_controller?


  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  def feedback_send
    FeedbackMailer.send_feedback(params).deliver_now
    redirect_to root_path
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name type])
  end
end
