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

  it 'is invalid without an email address' do
    @admin.email = nil
    expect(@admin).not_to be_valid
  end

  it 'is invalid without username' do
    @admin.username = nil
    expect(@admin).not_to be_valid
  end

  it 'is invalid without password' do
    @admin.password = nil
    expect(@admin).not_to be_valid
  end

end