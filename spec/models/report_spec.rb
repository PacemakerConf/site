require 'rails_helper'
require 'shoulda/matchers'

describe Report do
	
 	it { should belong_to(:conference) }
  
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:description) }

end