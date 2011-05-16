class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  helper_method :current_user  
    
  protected
    def set_locale
      I18n.locale = params[:locale] unless params[:locale].blank? 
    end 
  private 
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
	end 
end
