# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map do |type, msg|
      content_tag :p, msg, class: "flash #{type}"
    end
    .join("\n").html_safe
  end

  def welcome_message
    if user_signed_in?
      content_tag :div, "Welcome, #{current_user.email}  Guru", class: "nav user"
      link_to 'Logout', destroy_user_session_path, method: :delete
    end
  end

end
