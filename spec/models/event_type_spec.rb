require 'rails_helper'
require 'shoulda/matchers'

describe EventType do 
	
	it { should have_many(:events) }

	it { should validate_presence_of(:name) }

end
