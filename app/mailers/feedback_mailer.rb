class FeedbackMailer < ApplicationMailer

  def send_feedback(params)
    @feedback = params[:feedback]
    @name = params[:name]
    @admin = Admin.first
    mail to: @admin.email
  end
end
