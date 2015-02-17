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

	it 'is invalid without event_type_id' do
		expect(FactoryGirl.build(:event, event_type_id: nil)).not_to be_valid
	end

end
