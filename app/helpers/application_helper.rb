module ApplicationHelper
  def controller_stylesheet_link_tag
    css_file = case controller_name
    when "home"
      "https://land.xiaomi.net/res/c9369bd/css/micloudfe/home.css"
    end
    return "" if css_file.blank?
    raw %(<link href="#{css_file}" rel="stylesheet" data-turbolinks-track />)
  end
end
