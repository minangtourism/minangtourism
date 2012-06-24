class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :translate
  before_filter :authenticate_user!, :except => [:index, :show]

  layout :dynamic_layout

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to (user_signed_in? ? '/' : new_user_session_url), :alert => exception.message
  end

  def translate
    I18n.locale = :id
  end

  def dynamic_layout
    devise_controller? ? 'devise' : 'application'
  end
  
end
