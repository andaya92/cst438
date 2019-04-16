class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  
  # create current_user instance variable with current session user_id
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  
  
  # helper method for current user available in views
  helper_method :current_user
  
  def is_admin?
    !current_user.nil? and current_user.role_id == 3 
  end  
  
  def is_member?
    !current_user.nil? and current_user.role_id == 4
  end  
  
  helper_method :is_admin?
  
  helper_method :is_member?
  
  def authorize
    redirect_to "/session/new/", alert: "Not authorized" if current_user.nil?
  end  
  
  def authorize_admin
    redirect_to "/session/new/", notice: "Not authorized" unless is_admin?
  end  
  
  def authorize_student
    redirect_to "/session/new/", notice: "Not authorized" unless  is_member?
  end 
end
