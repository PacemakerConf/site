require 'rails_helper'
require 'shoulda/matchers'

describe Year do
	
	it { should have_many(:conferences) }

	it { should validate_presence_of(:name) }

	it { should validate_uniqueness_of(:name) }

end
