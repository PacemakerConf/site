class Admin::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'admin.html.erb'

  protect_from_forgery with: :exception

  def after_sign_in_path_for(admin)
    admin_conferences_path    
  end
  
  before_action :authenticate_admin!

end