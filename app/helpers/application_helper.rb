# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map do |key, message|
      key = key == 'alert' ? 'danger' : 'info'
      content_tag :div, message, class: "alert alert-#{key}"
    end
    .join("\n").html_safe
  end

end
