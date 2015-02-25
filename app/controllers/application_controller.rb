class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    session['current_user'] ||= {'role': User::GUEST}
  end  
  
  # redefine the current_ability method for CanCan.
  def current_ability
    @current_ability ||= Ability.new(current_admin || current_user) 
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url 
  end
end
