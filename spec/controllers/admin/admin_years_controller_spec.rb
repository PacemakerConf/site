require 'rails_helper'

describe Admin::YearsController do
	
	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end 

	describe 'GET #show' do
		before :each do
			@year = FactoryGirl.create(:year)
		end
	
		it 'assigns requested year to @year' do
			get :show, id: @year
			expect(assigns(:year)).to eq(@year)
		end

		it 'render the :show template' do
			get :show, id: @year
			expect(response).to render_template :show
		end
	end


	describe 'GET #index' do
		it 'assigns all years to @years' do
			first = FactoryGirl.create(:year, name: 2012)
			second = FactoryGirl.create(:year, name: 2013)
			get :index
			expect(assigns(:years)).to eq([first, second])
		end

		it 'render index template' do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #publish' do
		before :each do
			@year = FactoryGirl.create(:year)
		end
	
		xit 'assigns requested year to @year' do 
			get :publish, id: @year
			expect(assigns(:year)).to eq(@year)	
		end
		it 'change publish attribute to true'
		it '?render? publish template'
	end

	describe 'GET #new' do
		it 'assigns new year to @year' do
			get :new
			expect(assigns(:year)).to be_a_new(Year)
		end

		it 'render :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before :each do
			@year = FactoryGirl.create(:year)
		end
	
		it 'assigns requested year to @year' do
			get :edit, id: @year
			expect(assigns(:year)).to eq(@year)
		end
	
		it 'render the :edit template' do
			get :edit, id: @year
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do

		context 'with valid parameters' do

			it 'save new year to DB' do
				expect{ post :create, year: FactoryGirl.attributes_for(:year)
					}.to change(Year, :count).by(1)
			end

			it 'redirect somewhere'
		end

		context 'with invalid attr' do
			it 'doesn\'t save new year to DB'
			it 're-render :new template' 
		end
	end

	describe 'PATCH update' do
		before :each do
			@year = FactoryGirl.create(:year)
		end

		context 'with valid attr' do
			it 'asstign the requested year to @year' do
				patch :update, id: @year, year: FactoryGirl.attributes_for(:year)
				expect(assigns(:year)).to eq(@year)
			end
			
			it 'change @year attr' do
				patch :update, id: @year, year: FactoryGirl.attributes_for(:year, name: 2017)
				@year.reload
				expect(@year.name).to eq("2017")
			end
			it 'redirect somewhere'
		end

		context 'with invalid attr' do
			it 'doesn\'t change year attr' do
				patch :update, id: @year, year: FactoryGirl.attributes_for(:year, name: nil)
				@year.reload
				expect(@year.name).not_to eq(nil)
			end

			it 're-render edit template' 
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@year = FactoryGirl.create(:year)
		end

		it 'delete the year' do
			expect{delete :destroy, id: @year}.to change(Year, :count).by(-1)
		end

		it 'redirect to years#index' do
			delete :destroy, id: @year
			expect(response).to redirect_to admin_years_path
		end			
	end

end