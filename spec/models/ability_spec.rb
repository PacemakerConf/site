require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  describe "as admin" do
	  before(:each) do
      current_admin = Admin.create(username: 'adminstrator', password: 'very_secret',
                                    email: 'adminstrator@example.com')
      @current_ability = Ability.new(current_admin)
    end
    
    it "can manage all" do
      expect(@current_ability).to be_able_to(:manage, :all)      
    end
  end

  describe "as guest" do
    before(:each) do
      current_admin = nil
      current_user = User.new('role': User::GUEST)
      @current_ability = Ability.new(current_user||current_admin)
    end
    
    it "can read all" do
      expect(@current_ability).to be_able_to(:read, :all)      
    end
  end
end
