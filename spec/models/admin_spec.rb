require 'rails_helper'
require 'shoulda/matchers'

describe Admin do 

  before do
	@admin = Admin.new(username: 'adminstrator', password: 'very_secret',
						email: 'adminstrator@example.com')
  end

  it 'is valid with username, password and email' do
    expect(@admin).to be_valid
  end

  it 'password should contain at least 8 charcters ' do
	expect(@admin.password.length).to be >= 8
  end

end