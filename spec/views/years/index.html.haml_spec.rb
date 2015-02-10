require 'rails_helper'

RSpec.describe "years/index", :type => :view do
  before(:each) do
    assign(:years, [
      Year.create!(
        :name => "Name",
        :content => "MyText"
      ),
      Year.create!(
        :name => "Name",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of years" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
