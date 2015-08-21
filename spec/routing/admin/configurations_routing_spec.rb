require "rails_helper"

RSpec.describe Admin::ConfigurationsController, type: :routing do
  describe "routing" do

    it "routes to #edit" do
      expect(:get => "/admin/configurations").to route_to("admin/configurations#edit")
    end

    it "routes to #update" do
      expect(:put => "/admin/configurations/1").to route_to("admin/configurations#update", :id => "1")
    end

  end
end
