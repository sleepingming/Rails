module ApplicationHelper

  def current_date
    Time.zone.now
  end

  def github_url(author,repo)
    link_to "github.com/#{author}/#{repo}", rel: "nofollow", target: "_blank"
  end
end
