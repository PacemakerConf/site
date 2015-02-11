class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  # redefine the current_ability method for CanCan.
  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
  
end
