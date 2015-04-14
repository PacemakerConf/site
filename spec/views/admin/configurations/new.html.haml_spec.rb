require 'rails_helper'

RSpec.describe "admin/configurations/new", type: :view do
  before(:each) do
    assign(:admin_configuration, Admin::Configuration.new())
  end

  it "renders new admin_configuration form" do
    render

    assert_select "form[action=?][method=?]", admin_configurations_path, "post" do
    end
  end
end
