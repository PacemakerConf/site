require 'rails_helper'
require 'cancan/matchers'

describe Ability do

  describe "as admin" do
    it "can manage all" do
      @current_admin = Ability.new(FactoryGirl.build(:admin))
      expect(@current_admin).to be_able_to(:manage, :all)
    end
  end

  describe "as speaker" do
    before(:each) do
      @user = {'role' => User::SPEAKER}
      @current_user = Ability.new(@user)
    end

    it "can create speaker" do
      expect(@current_user).to be_able_to(:create, Speaker)
    end

    it "can create event" do
      expect(@current_user).to be_able_to(:create, Event)
    end

    it "cannot manage all" do
      expect(@current_user).to_not be_able_to(:manage, :all)
    end
  end

  describe "as guest" do
    before(:each) do
      @user = {'role' => User::GUEST}
      @current_user = Ability.new(@user)
    end
    
    it "can read all" do
      expect(@current_user).to be_able_to(:read, :all)
    end

    it "can create speaker" do
      expect(@current_user).to be_able_to(:create, Speaker)
    end
    
    it "cannot manage all" do
      expect(@current_user).to_not be_able_to(:manage, :all)
    end
  end

  describe "depend on private method get_user with input" do
    
    it "array Admin" do
      @current_admin = Ability.new(FactoryGirl.build(:admin))
      @input = @current_admin.send(:get_user, FactoryGirl.build(:admin))
      expect(@input.role).to eq(User::ADMIN)
    end

    it "hash(SPEAKER)" do
      @user = {'role' => User::SPEAKER}
      @current_user = Ability.new(@user)
      @input = @current_user.send(:get_user, @user)
      expect(@input.role).to eq(User::SPEAKER)
    end

    describe "hash (GUEST)" do
      before(:each) do
        @user = {'role' => User::GUEST}
        @current_user = Ability.new(@user)
      end

      it "" do
        @input = @current_user.send(:get_user, @user)
        expect(@input.role).to eq(User::GUEST)
      end

      it "" do
        @input = @current_user.send(:get_user, "some string")
        expect(@input.role).to eq(User::GUEST)
      end
    end
  end
end


