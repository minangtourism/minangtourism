module ApplicationHelper
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
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
