require 'rails_helper'
require 'shoulda/matchers'

describe Admin do
  it 'validate that password is > 8' do
    expect({Admin.new(username: 'adminstrator', password: 'v_secret',
            email: 'adminstrator@example.com')}).to raise_error
  end  

  before do
	@admin = Admin.new(username: 'adminstrator', password: 'very_secret',
						email: 'adminstrator@example.com')
  end

  it 'is valid with username, password and email' do
    expect(@admin).to be_valid
  end

  #it 'is invalid without username, password and email' do
   # @admin.username = nil
   # expect(@admin).not_to be_valid
  #end

end