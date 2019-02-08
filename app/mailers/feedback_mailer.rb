class FeedbackMailer < ApplicationMailer

  def send_feedback(params)
    @feedback = params[:feedback]
    return if @feedback.to_s.empty?

    @name = params[:name]
    return if @name.to_s.empty?

    mail to: Admin.first.first_admin.email
  end

end
