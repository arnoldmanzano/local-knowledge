module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x'.html_safe, class: "close", data: { dismiss: 'alert' })
              concat message
            end)
      flash.clear
    end
    nil
  end

  def average_stars(rating)
    rating = 0 if rating.nil?
    remainder = (5 - rating.round )
    '★' * rating.round + "☆" * remainder
  end

  def build_map_link(reply)
    places = reply.request.location.split(',')
    if places.length > 2
      city = places[-2] + "," + places[-1]
    else
      city = places[-1]
    end
    "https://maps.googleapis.com/maps/api/staticmap?size=800x600&scale=2" +
    "&zoom=12" +
    "&markers=color:green|label:M|" + reply.meeting_point + ",#{city}" +
    "&markers=color:red|label:S|" + reply.stopoffs.gsub(',',",#{city}|") + (",#{city}") +
    "&key=" unless reply.stopoffs.empty?
  end
  # "&center" + reply.meeting_point + ",#{city}" +
  # "&zoom=14" +

  def build_stopoff_links(reply)
    stops = reply.stopoffs.split(',')
    stops.map{|s| "<a href='http://google.com/search?q=#{s}' target='_blank'>#{s}</a>"}.join(',')
  end

# http://lmgtfy.com/?q=london
end
