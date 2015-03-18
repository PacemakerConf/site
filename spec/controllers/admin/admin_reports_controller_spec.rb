require 'rails_helper'

describe Admin::ReportsController do

	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end

	describe 'GET #show' do
		before :each do
			@report = FactoryGirl.create(:report)
		end
	
		it 'assigns requested reports to @reports' do
			get :show, id: @report
			expect(assigns(:report)).to eq(@report)
		end

		it 'render the :show template' do
			get :show, id: @report
			expect(response).to render_template :show
		end
	end

	describe 'GET #index' do
		#it 'assigns all reports to @reportss' do
			#soft1 = FactoryGirl.create(:report)
			#soft2 = FactoryGirl.create(:report)
			#get :index
			#expect(assigns(:reports)).to eq([soft1, soft2])
		#end

		it 'render index template' do
			get :index
			expect(response).to render_template :index
		end
	end


	describe 'GET #new' do
		it 'assigns new report to @report' do
			get :new
			expect(assigns(:report)).to be_a_new(Report)
		end

		it 'render :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before :each do
			@report = FactoryGirl.create(:report)
		end
	
		it 'assigns requested report to @report' do
			get :edit, id: @report
			expect(assigns(:report)).to eq(@report)
		end
	
		it 'render the :edit template' do
			get :edit, id: @report
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do

		context 'with valid parameters' do

			it 'save new report to DB' do
				expect{ post :create, report: FactoryGirl.attributes_for(:report)}.to change(Report, :count).by(1)
			end

			it 'redirect to admin_conference_path' do
				post :create, report: FactoryGirl.attributes_for(:report)
				expect(response).to redirect_to admin_conferences_path
			end
		end

		context 'with invalid attr' do
			it 'doesnt save new report to database' do
				expect{ post :create, report: FactoryGirl.attributes_for(:report, title: nil)}.not_to change(Report, :count)
			end

			it 're-render :new template' do
				post :create, report: FactoryGirl.attributes_for(:report, title: nil)
				expect(response).to render_template :new
			end
		end
	end
  	
  	describe 'PATCH update' do
		before :each do
			@report = FactoryGirl.create(:report)
		end

		context 'with valid attr' do
			it 'asstign the requested report to @report' do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report)
				expect(assigns(:report)).to eq(@report)
			end
			
			it 'change @report attr' do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report, title: 'Second Report' )
				@report.reload
				expect(@report.title).to eq("Second Report")
			end

			it 'redirect to admin_reports_path' do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report)
				expect(response).to redirect_to admin_conferences_path
			end
		end

		context 'with invalid attr' do
			it 'doesnt change report attr' do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report, title: "Second Report")
				@report.reload
				expect(@report.title).not_to eq("First Report")
			end

			it 're-render edit template' do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report, title: nil)
				@report.reload
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@report = FactoryGirl.create(:report)
		end

		it 'delete the report' do
			expect{delete :destroy, id: @report}.to change(Report, :count).by(-1)
		end

		it 'redirect to reports#index' do
			delete :destroy, id: @report
			expect(response).to redirect_to admin_reports_path
		end			
	end
 
end

	


