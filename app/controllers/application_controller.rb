class ApplicationController < ActionController::Base


  protect_from_forgery

  before_filter :authenticate_user!, :translate

  def translate
    I18n.locale = :id
  end
  
end
