require 'rails_helper'
require 'shoulda/matchers'

describe Event do 

	it { should belong_to(:speaker) }
	it { should belong_to(:conference) }
	it { should belong_to(:event_type) }

	it 'has valid factory' do
		expect(FactoryGirl.create(:event) ).to be_valid
	end

	it 'is invalid without title' do
		expect(FactoryGirl.build(:event, title: nil)).not_to be_valid
	end

	it 'is invalid without conference_id' do
		expect(FactoryGirl.build(:event, conference_id: nil)).not_to be_valid
	end

	it 'is invalid with speakerEvent without speaker' do
		event_type = FactoryGirl.create(:event_type, speakerEvent: true)
		expect(FactoryGirl.build(:event, event_type: event_type)).not_to be_valid
	end
	
	it 'is invalid with speaker without speaekrEvent' do 
		expect(FactoryGirl.build(:event, speaker_id: 1)).not_to be_valid
	end

	it 'get new position (at least 3 examples)'

end
