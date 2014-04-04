module ApplicationHelper

  def controller_stylesheet_link_tag
    case controller_name
    when "home","contacts","sms"
      stylesheet_link_tag "https://land.xiaomi.net/res/c9369bd/css/micloudfe/home.css"
    end
  end

  def controller_javascript_include_tag
  end
end
