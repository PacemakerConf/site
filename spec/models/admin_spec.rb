require 'rails_helper'
require 'shoulda/matchers'

describe Admin do
  
  it 'is valid with username, password and email' do
    expect(FactoryGirl.build(:admin)).to be_valid
  end

  it 'is invalid without an email address' do
    expect(FactoryGirl.build(:admin, email: nil)).not_to be_valid
  end

  it 'is invalid without username' do
    expect(FactoryGirl.build(:admin, username: nil)).not_to be_valid
  end

  it 'is invalid without password' do
    expect(FactoryGirl.build(:admin, password: nil)).not_to be_valid
  end

end