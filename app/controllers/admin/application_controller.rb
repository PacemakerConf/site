class Admin::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_admin!

  def after_sign_in_path_for(admin)
    admin_conferences_path
  end

  layout 'admin'
  
end
