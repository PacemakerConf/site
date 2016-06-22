require 'rails_helper'

describe ConferencesController do

	before :each do
		year = FactoryGirl.create(:year)
		@admin = FactoryGirl.create(:admin)
		@conference = FactoryGirl.create(:conference, year: year)
	end
	
	describe 'GET #show' do
		before :each do
			get :show, name: @conference.route
		end

		it 'assign requested conference to @conference' do
			expect(assigns(:conference)).to eq(@conference)
		end

		it 'render :show template' do
			expect(response).to render_template :show
		end
	end

	describe 'GET #location' do
		it 'assign conferences location to @location' do
			location = FactoryGirl.create(:location, conference: @conference)
			get :location, name: @conference.route
			expect(assigns(:location)).to eq(location)
		end

		it 'render :location template' do
			get :location, name: @conference.route
			expect(response).to render_template :location
		end			
	end
	
	describe 'GET #speakers' do
		xit 'assign conferences speaker_events to @events' do
			speaker_event_type = FactoryGirl.create(:event_type, speaker_event: true)
			non_speaker_event_type = FactoryGirl.create(:event_type, speaker_event: false)
			speaker_event = FactoryGirl.create(:event, event_type: speaker_event_type, speaker_id: 1)
			non_speaker_event = FactoryGirl.create(:event, event_type: non_speaker_event_type)
			get :speakers, name: @conference.route
			expect(assigns(:events)).to eq([speaker_event])
		end
			
		it 'render :speakers template' do
			get :speakers, name: @conference.route
			expect(response).to render_template :speakers
		end
	end

	describe 'GET #schedule' do
		xit 'assign all conferences events to @events' do
			speaker_events = FactoryGirl.create(:event_type, speaker_event: true)
			non_speaker_events = FactoryGirl.create(:event_type, speaker_event: false)
			speaker_event = FactoryGirl.create(:event, event_type: speaker_events, speaker_id: 1)
			non_speaker_event = FactoryGirl.create(:event, event_type: non_speaker_events)
			get :schedule, name: @conference.route
			expect(assigns(:events)).to eq([speaker_event, non_speaker_event])
		end

		it 'render :schedule template' do
			get :schedule, name: @conference.route
			expect(response).to render_template :schedule
		end
	end
	
	describe 'GET #report' do
		it 'assign conferences report to @report' do
			report = FactoryGirl.create(:report, conference: @conference)
			get :report, name: @conference.route
			expect(assigns(:report)).to eq(report)
		end

		it 'render :report template' do
			get :report, name: @conference.route
			expect(response).to render_template :report
		end
	end

	describe 'unpublished conference' do
		before :each do
			@conference.published = false
		end

	it ''
	it ''		

	end
end