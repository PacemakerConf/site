require 'rails_helper'

describe EventsController do
	
	describe 'GET #new' do
		xit 'assign a new event to @event' do
			get :new
			expect(assigns(:event)).to be_a_new(Event)
		end

		xit 'render the :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'POST #create' do
		context 'with valid attr' do
			xit 'save new event to db' do
				expect{ post :create, event: FactoryGirl.attributes_for(:event)
					}.to change(Event, :count).by(1)
			end 
			it 'redirect to ... i don\'t know '
		end
		context 'with invalid attr' do
			it 'doesn\'t save event to db'
			it 'render :new template again'
		end
	end

end