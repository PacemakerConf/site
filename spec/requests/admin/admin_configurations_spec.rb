require 'rails_helper'

RSpec.describe "Admin::Configurations", type: :request do
	before :each do
		@admin = FactoryGirl.create(:admin)
	end

  describe "GET /admin/configurations" do
    it "works! (now write some real specs)" do
      get edit_admin_configurations_path
      expect(response).to have_http_status(302)
    end
  end
end
