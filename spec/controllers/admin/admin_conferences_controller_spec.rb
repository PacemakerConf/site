require 'rails_helper'

describe Admin::ConferencesController do
	
	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end 

	describe 'GET publish' do
		it ''
	end

	describe 'GET schedule' do
		xit 'assigns to @event all events of this conf in order its positions' do
			year = FactoryGirl.create(:year)
			conference = FactoryGirl.create(:conference, year: year)
			second_event = FactoryGirl.create(:event, conference: conference, position: 2)
			first_event = FactoryGirl.create(:event, conference: conference, position: 1)
			get :schedule, name: conference.route
			expect(assigns(:events)).to eq([first_event, second_event])
		end
	end

	describe 'GET #index' do
		it 'assigns all conferences to @conferences' do
			first = FactoryGirl.create(:conference)
			second = FactoryGirl.create(:conference)
			get :index
			expect(assigns(:conferences)).to eq([first, second])
		end

		it 'render index template' do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #new' do
		it 'assigns new conference to @conference' do
			get :new
			expect(assigns(:conference)).to be_a_new(Conference)
		end

		it 'render :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before :each do
			year = FactoryGirl.create(:year)
			@conference = FactoryGirl.create(:conference, year: year)
		end
	
		it 'assigns requested conference to @conference' do
			get :edit, name: @conference.route
			expect(assigns(:conference)).to eq(@conference)
		end
	
		it 'render the :edit template' do
			get :edit, name: @conference.route
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do

		context 'with valid parameters' do

			it 'save new conference to DB' do
				expect{ post :create, conference: FactoryGirl.attributes_for(:conference)
					}.to change(Conference, :count).by(1)
			end

			it 'redirect to admin_conferences_path' do
				post :create, conference: FactoryGirl.attributes_for(:conference)
				expect(response).to redirect_to admin_conferences_path
			end
		end

		context 'with invalid attr' do
			it 'doesn\'t save new conference to DB' do
				expect{ post :create, conference: FactoryGirl.attributes_for(:conference, name: 'BSOD', year: nil)}.not_to change(Conference, :count)
			end

			it 're-render :new template' do
				post :create, conference: FactoryGirl.attributes_for(:conference, name: 'BSOD', year: nil)
				expect(response).to render_template :new
			end
		end
	end

	describe 'PATCH update' do
		before :each do
			year = FactoryGirl.create(:year)
			@conference = FactoryGirl.create(:conference, year: year)
		end

		context 'with valid attr' do
			it 'asstign the requested conference to @conference' do
				patch :update, name: @conference.route, conference: FactoryGirl.attributes_for(:conference)
				expect(assigns(:conference)).to eq(@conference)
			end
			
			it 'change @conference attr' do
				patch :update, name: @conference.route, conference: FactoryGirl.attributes_for(:conference, name: 'BSOD' )
				@conference.reload
				expect(@conference.name).to eq("BSOD")
			end

			it 'redirect to admin_conferences_path' do
				patch :update, name: @conference.route,
					conference: FactoryGirl.attributes_for(:conference)
				expect(response).to redirect_to admin_conferences_path
			end
		end

		context 'with invalid attr' do
			it 'doesn\'t change conference attr' do
				patch :update, name: @conference.route, conference: FactoryGirl.attributes_for(:conference, name: nil)
				@conference.reload
				expect(@conference.name).not_to be_nil
			end

			xit 're-render edit template' do
				patch :update, name: @conference.route, conference: FactoryGirl.attributes_for(:conference, name: "BSOD", year: nil)
				@conference.reload
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			year = FactoryGirl.create(:year)
			@conference = FactoryGirl.create(:conference, year: year)
		end

		it 'delete the conference' do
			expect{delete :destroy, name: @conference.route}.to change(Conference, :count).by(-1)
		end

		it 'delete all events,news,report and location of this conference'

		it 'redirect to conferences#index' do
			delete :destroy, name: @conference.route
			expect(response).to redirect_to admin_conferences_path
		end			
	end

end