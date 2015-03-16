require 'rails_helper'

describe Admin::ApplicationController do
	
	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end 
	
	describe 'GET #show' do
		it 'redirect to conferences list after sign_in'	

		it 'render the :show template'

	end

end