class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :authenticate_user!, :translate

  layout :dynamic_layout

  def translate
    I18n.locale = :id
  end

  def dynamic_layout
    devise_controller? ? 'devise' : 'application'
  end
  
end
