require "rails_helper"

RSpec.describe Admin::ConfigurationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/configurations").to route_to("admin/configurations#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/configurations/new").to route_to("admin/configurations#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/configurations/1").to route_to("admin/configurations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/configurations/1/edit").to route_to("admin/configurations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/configurations").to route_to("admin/configurations#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/configurations/1").to route_to("admin/configurations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/configurations/1").to route_to("admin/configurations#destroy", :id => "1")
    end

  end
end
