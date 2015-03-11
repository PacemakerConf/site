require 'rails_helper'

describe ConferencesController do
	
	describe 'GET #show' do
		xit 'assign requested conference to @conference' do
			conference = FactoryGirl.create(:conference)
			get :show, name: conference.fullname
			expect(assigns(:conference)).to eq(conference)
		end

		xit 'render :show template' do
			conference = FactoryGirl.create(:conference)
			get :show, name: conference.fullname
			expect(response).to render_template :show
		end
	end

	describe 'GET #location' do
		it 'assign conferences location to @location' 
		it 'render :location template'
	end
	
	describe 'GET #speakers' do
		it 'assign conferences speaker events to @events' 
		it 'render :speakers template'
	end
	
	describe 'GET #schedule' do
		it 'assign all conferences events to @events' 
		it 'render :schedule template'
	end
	
	describe 'GET #report' do
		it 'assign conferences report to @report' 
		it 'render :report template'
	end

end