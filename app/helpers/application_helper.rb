module ApplicationHelper
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
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

  def prompt_sign_in?
    !!params[:prompt_sign_in]
  end

  def resource
    @resource ||= User.new
  end

  def resource_name
    :user
  end

  def profile_left_nav(*args, &block)
    text = block_given? ? capture(&block) : args.shift
    url = args.first
    content_tag :li, link_to(text, url), :class => (:active if current_page?(url))
  end
end
