module ApplicationHelper

  def current_date
    Time.zone.now
  end

  def github_url(author,repo)
    link_to "github.com/#{author}/#{repo}", rel: "nofollow", target: "_blank"
  end

  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class: 'flash alert'
    end
  end
end
