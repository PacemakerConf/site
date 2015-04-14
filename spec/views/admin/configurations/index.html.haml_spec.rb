require 'rails_helper'

RSpec.describe "admin/configurations/index", type: :view do
  before(:each) do
    assign(:admin_configurations, [
      Admin::Configuration.create!(),
      Admin::Configuration.create!()
    ])
  end

  it "renders a list of admin/configurations" do
    render
  end
end
