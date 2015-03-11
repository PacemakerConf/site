require 'rails_helper'

describe Admin::EventsController do
	
	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end 
	
	describe 'GET #show' do
		it 'assigns requested event to @event' do
			event = FactoryGirl.create(:event)
			get :show, id: event
			expect(assigns(:event)).to eq(event)
		end

		it 'render the :show template'

	end

end