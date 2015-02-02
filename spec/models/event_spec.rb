require 'rails_helper'
require 'shoulda/matchers'

describe Event do 

	it { should belong_to(:speaker) }
	it { should belong_to(:conference) }
	it { should belong_to(:event_type) }

	before do
		@event = Event.new(title: 'Beer-break', conference_id: 1, event_type_id: 1)
	end

	it 'should be valid with title, conf_id and event_type id' do
		expect(@event).to be_valid
	end

	it 'should be invalid without title' do
		@event.title = nil
		expect(@event).not_to be_valid
	end

	it 'should be invalid without conference_id' do
		@event.conference_id = nil
		expect(@event).not_to be_valid
	end

	it 'should be invalid without event_type_id' do
		@event.event_type_id = nil
		expect(@event).not_to be_valid
	end

end
