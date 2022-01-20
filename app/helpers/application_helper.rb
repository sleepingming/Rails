module ApplicationHelper

  def current_date
    Time.zone.now
  end

  def github_url(author,repo)
    link_to "github.com/#{author}/#{repo}", rel: "nofollow", target: "_blank"
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :div, raw(msg), class: 'flash #{key}'
    end.join.html_safe
  end
end
