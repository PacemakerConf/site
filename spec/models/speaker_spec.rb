require 'rails_helper'
require 'shoulda/matchers'

describe Speaker do
	
	it {should have_many(:events) }
	it {should have_many(:conferences) }

	before do
		@speaker = Speaker.new(name: 'Agrronom')
	end

	it 'be valid with name' do
		expect(@speaker).to be_valid
	end

	it 'should be invalid without name' do
		@speaker.name = nil
		expect(@speaker).not_to be_valid
	end 
end
