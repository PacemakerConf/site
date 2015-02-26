require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  describe "as admin" do
	before(:each) do
      current_admin = Admin.new()
      @current_ability = Ability.new(current_admin)
    end
    
    it "can manage all" do
      expect(@current_ability).to be_able_to(:manage, :all)      
    end
  end
end
