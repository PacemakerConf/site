require 'rails_helper'
require 'shoulda/matchers'

describe User do
	before do
	  @user = User.new(role: 'Guest')
	end 

	it 'initialize changes role to supplied as argument' do 
	  expect(@user.role)=='Guest'
	end


end