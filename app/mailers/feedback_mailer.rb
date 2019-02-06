class FeedbackMailer < ApplicationMailer

  def send_feedback(params)
    @feedback = params[:feedback]
    @name = params[:name]
    mail to: Admin.first.email
  end

end
