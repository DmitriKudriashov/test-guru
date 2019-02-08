class FeedbackMailer < ApplicationMailer

  def send_feedback(params)
    return unless params[:feedback].presence

    @feedback = params[:feedback]

    return unless params[:name].presence

    @name = params[:name]

    mail to: Admin.first.first_admin.email
  end

end
