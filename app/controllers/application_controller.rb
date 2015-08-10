class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    current_admin.nil? ?  
      session['current_user'] ||= {'role' => User::GUEST} :
      session['current_user'] = {'role'=> User::ADMIN}
  end  
  
  # redefine the current_ability method for CanCan.
  def current_ability
    @current_ability ||= Ability.new(current_admin || current_user) 
  end
 
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
