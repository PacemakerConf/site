require 'rails_helper'

describe Admin::LocationsController do

	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end

	describe 'GET #show' do
		before :each do
			@location = FactoryGirl.create(:location)
		end
	
		it 'assigns requested location to @location' do
			get :show, id: @location
			expect(assigns(:location)).to eq(@location)
		end

		it 'render the :show template' do
			get :show, id: @location
			expect(response).to render_template :show
		end
	end

	describe 'GET #index' do
		#it 'assigns all locations to @locations' do
			#soft1 = FactoryGirl.create(:location)
			#soft2 = FactoryGirl.create(:location)
			#get :index
			#expect(assigns(:locations)).to eq([soft1, soft2])
		#end

		it 'render index template' do
			get :index
			expect(response).to render_template :index
		end
	end


	describe 'GET #new' do
		it 'assigns new location to @location' do
			get :new
			expect(assigns(:location)).to be_a_new(Location)
		end

		it 'render :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before :each do
			@location = FactoryGirl.create(:location)
		end
	
		it 'assigns requested location to @location' do
			get :edit, id: @location
			expect(assigns(:location)).to eq(@location)
		end
	
		it 'render the :edit template' do
			get :edit, id: @location
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do

		context 'with valid parameters' do

			it 'save new location to DB' do
				expect{ post :create, location: FactoryGirl.attributes_for(:location)}.to change(Location, :count).by(1)
			end

			it 'redirect to admin_conference_path' do
				post :create, location: FactoryGirl.attributes_for(:location)
				expect(response).to redirect_to admin_conferences_path
			end
		end

		context 'with invalid attr' do
			it 'doesnt save new location to database' do
				expect{ post :create, location: FactoryGirl.attributes_for(:location, address: nil)}.not_to change(Location, :count)
			end

			it 're-render :new template' do
				post :create, location: FactoryGirl.attributes_for(:location, address: nil)
				expect(response).to render_template :new
			end
		end
	end
  	
  	describe 'PATCH update' do
		before :each do
			@location = FactoryGirl.create(:location)
		end

		context 'with valid attr' do
			it 'asstign the requested location to @location' do
				patch :update, id: @location, location: FactoryGirl.attributes_for(:location)
				expect(assigns(:location)).to eq(@location)
			end
			
			it 'change @location attr' do
				patch :update, id: @location, location: FactoryGirl.attributes_for(:location, address: 'Pasternaka 5' )
				@location.reload
				expect(@location.address).to eq("Pasternaka 5")
			end

			it 'redirect to admin_locations_path' do
				patch :update, id: @location, location: FactoryGirl.attributes_for(:location)
				expect(response).to redirect_to admin_conferences_path
			end
		end

		context 'with invalid attr' do
			it 'doesnt change location attr' do
				patch :update, id: @location, location: FactoryGirl.attributes_for(:location, address: "Pasternaka 6")
				@location.reload
				expect(@location.address).not_to eq("Pasternaka 5")
			end

			it 're-render edit template' do
				patch :update, id: @location, location: FactoryGirl.attributes_for(:location, address: nil)
				@location.reload
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@location = FactoryGirl.create(:location)
		end

		it 'delete the location' do
			expect{delete :destroy, id: @location}.to change(Location, :count).by(-1)
		end

		it 'redirect to locations#index' do
			delete :destroy, id: @location
			expect(response).to redirect_to admin_locations_path
		end			
	end
 
end

	


