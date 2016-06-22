require 'rails_helper'

describe Admin::EventTypesController do
	
	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end 

	describe 'GET #show' do
		before :each do
			@eventType = FactoryGirl.create(:event_type)
		end
	
		it 'assigns requested event type to @eventType' do
			get :show, id: @eventType
			expect(assigns(:event_type)).to eq(@eventType)
		end

		it 'render the :show template' do
			get :show, id: @eventType
			expect(response).to render_template :show
		end
	end


	describe 'GET #index' do
		before :each do
			@eventType = FactoryGirl.create(:event_type)
		end
		
		xit 'assigns all event types to @eventType' do
			second = FactoryGirl.create(:event_type, name: 'eventtype name')
			get :index
			expect(assigns(:event_type)).to eq([@eventType, second])
		end

		it 'render :index template' do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #new' do
		it 'assigns new event type to @eventType' do
			get :new
			expect(assigns(:event_type)).to be_a_new(EventType)
		end

		it 'render :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before :each do
			@eventType = FactoryGirl.create(:event_type)
		end
	
		it 'assigns requested event type to @eventType' do
			get :edit, id: @eventType
			expect(assigns(:event_type)).to eq(@eventType)
		end
	
		it 'render the :edit template' do
			get :edit, id: @eventType
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do
		
	end

	describe 'PATCH update' do
		before :each do
			@eventType = FactoryGirl.create(:event_type)
		end

		context 'with valid attr' do
			it 'asstign the requested event type to @eventType' do
				patch :update, id: @eventType, event_type: FactoryGirl.attributes_for(:event_type)
				expect(assigns(:event_type)).to eq(@eventType)
			end

			it 'change @eventType attr' do
				patch :update, id: @eventType, event_type: FactoryGirl.attributes_for(:event_type, name: 'Registration2')
				@eventType.reload
				expect(@eventType.name).to eq('Registration2')
			end

			it 'redirect to admin_event_types_path' do
				patch :update, id: @eventType, event_type: FactoryGirl.attributes_for(:event_type)
				expect(response).to redirect_to controller: 'admin/event_types', action: 'index'
			end
		end

		context 'with invalid attr' do
			it 'doesn\'t change event types attr' do
				patch :update, id: @eventType, event_type: FactoryGirl.attributes_for(:event_type, name: 'la', default_duration: nil)
				@eventType.reload
				expect(@eventType.name).not_to eq('la')
			end

			it 're-render edit template' do
				patch :update, id: @eventType, event_type: FactoryGirl.attributes_for(:event_type, name: 'la', default_duration: nil)
				expect(response).to  render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@eventType = FactoryGirl.create(:event_type)
		end

		it 'delete the event type' do
			expect{delete :destroy, id: @eventType}.to change(EventType, :count).by(-1)
		end

		it 'redirect to event_types#index' do
			delete :destroy, id: @eventType
			expect(response).to redirect_to admin_event_types_path
		end			
	end

end