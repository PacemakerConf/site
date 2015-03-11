require 'rails_helper'

describe EventsController do
	
	describe 'GET #new' do
		it 'assign a new event to @event' do
			get :new
			expect(assigns(:event)).to be_a_new(Event)
		end

		it 'render the :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'POST #create' do
		
	end

end