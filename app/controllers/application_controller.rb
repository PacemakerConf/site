class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(admin)
    admin_conferences_path    
  end
  
  # redefine the current_ability method for CanCan.
  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
  
end
