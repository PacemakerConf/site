require 'rails_helper'

RSpec.describe "years/new", :type => :view do
  before(:each) do
    assign(:year, Year.new(
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new year form" do
    render

    assert_select "form[action=?][method=?]", years_path, "post" do

      assert_select "input#year_name[name=?]", "year[name]"

      assert_select "textarea#year_content[name=?]", "year[content]"
    end
  end
end
