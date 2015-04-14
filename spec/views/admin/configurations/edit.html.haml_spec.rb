require 'rails_helper'

RSpec.describe "admin/configurations/edit", type: :view do
  before(:each) do
    @admin_configuration = assign(:admin_configuration, Admin::Configuration.create!())
  end

  it "renders the edit admin_configuration form" do
    render

    assert_select "form[action=?][method=?]", admin_configuration_path(@admin_configuration), "post" do
    end
  end
end
