class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :translate
  before_filter :authenticate_user!, :except => [:index, :show]

  layout :dynamic_layout

  helper_method :after_inactive_sign_up_path_for, :after_sign_in_path_for, :after_sign_up_path_for

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to (user_signed_in? ? main_app.root_url : new_user_session_url), :alert => exception.message
  end

  def translate
    I18n.locale = :id
  end

  def dynamic_layout
    devise_controller? ? 'devise' : 'application'
  end

  def after_sign_in_path_for(resource)
    scope = Devise::Mapping.find_scope!(resource)
    sign_in_url = url_for(action: "new", controller: "sessions", only_path: false, protocol: "http")
    @_after_sign_in_path_for ||= {}
    @_after_sign_in_path_for[scope] ||= if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || root_url
    end
  end

end
