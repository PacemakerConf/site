require 'rails_helper'

describe YearsController do
	
	describe 'GET #show' do
		xit 'assign requested year to @year' do
			year = FactoryGirl.create(:year)
			get :show, name: year.name
			expect(assign(:year)).to eq(year)
		end

		xit 'assign count of conf of this year to @conference_count' do
			year = FactoryGirl.create(:year)
			conference = FactoryGirl.create(:conference, year: year.name)
			expect(assign(:conference_count)).to eq(1)
		end

		it 'raise not found error if user cant read year'
	end	

end