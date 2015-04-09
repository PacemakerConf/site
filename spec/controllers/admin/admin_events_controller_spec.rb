require 'rails_helper'

describe Admin::EventsController do
	
	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end 

	describe 'GET #show' do
		before :each do
			@event = FactoryGirl.create(:event)
		end
	
		it 'assigns requested event to @event' do
			get :show, id: @event
			expect(assigns(:event)).to eq(@event)
		end

		it 'render the :show template' do
			get :show, id: @event
			expect(response).to render_template :show
		end
	end


	describe 'GET #index' do
		before :each do
			@event = FactoryGirl.create(:event)
		end
	
		context 'with conf_id GET-parameter' do
			before :each do
				@conference = FactoryGirl.create(:conference, id: 1)
			end
				
			xit 'assigns all events of this conference to @events' do
				second = FactoryGirl.create(:event, title: 'event itle',  conference_id: 2)
				get :index, conf_id: 1
				expect(assigns(:events)).to eq([@event])
			end 
		
			it 'assign requested conference to @conference' do
				get :index, conf_id: 1
				expect(assigns(:conference)).to eq(@conference)
			end				
		
			it 'assigns all sperker events of this conference to @speaker_events' do
				get :index, conf_id: 1
				speaker_event_type = FactoryGirl.create(:event_type, speakerEvent: true, name: 'topic')
				speaker_event = FactoryGirl.create(:event, event_type: speaker_event_type, speaker_id: 1)
				expect(assigns(:speaker_events)).to eq([speaker_event])
			end
		
			xit 'assigns all non-speaker events of this conference to @non_speaker_events' do
				get :index, conf_id: 1
				speaker_event_type = FactoryGirl.create(:event_type, speakerEvent: true)
				speaker_event = FactoryGirl.create(:event, event_type: speaker_event_type, speaker_id: 1)
				expect(assigns(:non_speaker_events)).to eq([@event])
			end
		end

		context 'without conf_id' do
			xit 'assigns all events to @events' do
				second = FactoryGirl.create(:event, conference_id: 2)
				get :index
				expect(assigns(:events)).to eq([@event, second])
			end

			xit 'assigns all sperker events to @speaker_events' do 
				get :index
				speaker_event_type = FactoryGirl.create(:event_type, speakerEvent: true)
				speaker_event = FactoryGirl.create(:event, event_type: speaker_event_type, speaker_id: 1, conference_id: 2)
				expect(assigns(:speaker_events)).to eq([speaker_event])
			end

			xit 'assigns all non-speaker events to @non_speaker_events' do
				get :index
				second = FactoryGirl.create(:event, conference_id: 2)
				expect(assigns(:non_speaker_events)).to eq([@event, second])
			end
		end

		it 'render :index template' do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'PATCH #publish' do
		before :each do
			@event = FactoryGirl.create(:event)
		end
	
		xit 'mark the event as published' do 
			patch :publish, id: @event, event: FactoryGirl.attributes_for(:event)
		end
	end

	describe 'GET #new' do
		xit 'assigns new event to @event' do
			get :new
			expect(assigns(:event)).to be_a_new(Event)
		end

		xit 'render :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before :each do
			@event = FactoryGirl.create(:event)
		end
	
		it 'assigns requested event to @event' do
			get :edit, id: @event
			expect(assigns(:event)).to eq(@event)
		end
	
		it 'render the :edit template' do
			get :edit, id: @event
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do

		before :each do
			@conference = FactoryGirl.create(:conference)
		end
		
		xit 'assigns current conference to @conference' do
			post :create, event: FactoryGirl.attributes_for(:event)
			expect(assigns(:conference)).to eq(@conference)
		end

		context 'with valid parameters' do

			xit 'save new event to DB' do
				expect{ post :create, event: FactoryGirl.attributes_for(:event)
					}.to change(Event, :count).by(1)
			end

			xit 'redirect to schedule' do
				post :create, event: FactoryGirl.attributes_for(:event)
				expect(response).to redirect_to schedule_admin_conference_path(assigns(:conference))
			end
		end

		context 'with invalid attr' do
			xit 'doesn\'t save new event to DB' do
				expect{ post :ceate, event: FactoryGirl.attributes_for(:event, title: nil)}.not_to change(Event, :count)
			end

			xit 're-render :new template' do
				post :create, event: FactoryGirl.attributes_for(:event, title: nil)
				expect(response).to render_template :new
			end
		end
	end

	describe 'PATCH update' do
		before :each do
			@event = FactoryGirl.create(:event)
		end

		context 'with valid attr' do
			it 'asstign the requested event to @event' do
				patch :update, id: @event, event: FactoryGirl.attributes_for(:event)
				expect(assigns(:event)).to eq(@event)
			end

			it 'change @event attr' do
				patch :update, id: @event, event: FactoryGirl.attributes_for(:event, title: 'registration', conference_id: 2)
				@event.reload
				expect(@event.title).to eq('registration')
				expect(@event.conference_id).to eq(2)
			end

			it 'redirect to admin_events_path' do
				patch :update, id: @event, event: FactoryGirl.attributes_for(:event)
				expect(response).to redirect_to controller: 'admin/events', action: 'index', conf_id: @event.conference_id
			end
		end

		context 'with invalid attr' do
			it 'doesn\'t change event attr' do
				patch :update, id: @event, event: FactoryGirl.attributes_for(:event, title: 'lalala', conference_id: nil)
				@event.reload
				expect(@event.title).not_to eq('lalala')
				expect(@event.conference_id).to eq(1)
			end

			it 're-render edit template' do
				patch :update, id: @event, event: FactoryGirl.attributes_for(:event, title: 'lalala', conference_id: nil)
				expect(response).to  render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@event = FactoryGirl.create(:event)
		end

		it 'delete the event' do
			expect{delete :destroy, id: @event}.to change(Event, :count).by(-1)
		end

		it 'redirect to events#index' do
			delete :destroy, id: @event
			expect(response).to redirect_to controller: 'admin/events', action: 'index', conf_id: 1
		end			
	end

end