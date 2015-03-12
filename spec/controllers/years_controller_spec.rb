require 'rails_helper'

describe YearsController do
	
	describe 'GET #show' do
		it 'assign requested year to @year' do
			year = FactoryGirl.create(:year)
			get :show, name: year.name
			expect(assigns(:year)).to eq(year)
		end

		it 'render :show template' do
			year = FactoryGirl.create(:year)
			get :show, name: year.name
			expect(response).to render_template :show
		end
		
		it 'raise not found error if user cant read year'
	end	

end