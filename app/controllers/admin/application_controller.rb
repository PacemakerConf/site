class Admin::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'admin.html.erb'

  protect_from_forgery with: :exception

  before_action :authenticate_admin!

end