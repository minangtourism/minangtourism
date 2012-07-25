module ApplicationHelper
  def devise_mapping
    @devise_mapping ||= Devise.mappings[resource_name]
  end

  def flash_messages
    flash.map do |type, message|
      alert_class = case type
      when :notice          then :info
      when :alert, :warning then :error
      else type
      end
      content_tag :div, :class => "alert alert-#{alert_class} fade in" do
        button_tag(raw("&times;"), type: "button", :class => "close", data: { dismiss: "alert" }) + h(message)
      end
    end.join("\n").html_safe
  end

  def icon_tag(icon_name)
    content_tag :i, nil, :class => "icon-#{icon_name}"
  end

  def prompt_sign_in?
    !!params[:prompt_sign_in]
  end

  def resource
    @resource ||= User.new
  end

  def resource_name
    :user
  end

  # Usage:
  #   <%= profile_left_nav "Profile", profile_path(@profile), icon: "home" %>
  # Or with block:
  #   <%= profile_left_nav profile_path(@profile) do %>
  #     <i class="icon-home"></i> Profile
  #   <% end %>
  # Output:
  #   <li><a href="/profiles/1"><i class="icon-home"></i> Profile</a></li>
  def profile_left_nav(*args, &block)
    options = args.extract_options!
    text = block_given? ? capture(&block) : args.shift
    text = icon_tag(options[:icon]) + " " + text if options[:icon]
    url = args.first

    content_tag :li, link_to(text, url), :class => (:active if options[:active] || current_page?(url))
  end
end
