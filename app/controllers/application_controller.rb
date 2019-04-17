class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  
  # create current_user instance variable with current session user_id
  def current_user
    @current_user = nil
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue StandardError => e
      puts e
      puts "Error finding current logged in user"
      @current_user = nil
    end
    @current_user
  end  
  
  # helper method for current user available in views
  helper_method :current_user
  
  def is_admin?
    @admin_role = Role.find_by title: "Admin"
    !current_user.nil? and current_user.role_id == @admin_role.id
  end  
  
  def is_member?
    @member_role = Role.find_by title: "Member"
    !current_user.nil? and current_user.role_id == @member_role.id
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
