require 'rails_helper'

RSpec.describe "admin/configurations/show", type: :view do
  before(:each) do
    @admin_configuration = assign(:admin_configuration, Admin::Configuration.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
