class Admin::NewsController < Admin::ApplicationController
  layout 'admin'
	before_action :authenticate_admin!


end