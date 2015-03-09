require 'rails_helper'

RSpec.describe "news/index", :type => :view do
  before(:each) do
    assign(:news, [
      News.create!(
        :title => "Title",
        :content => "MyText",
        :conference_id => 1
      ),
      News.create!(
        :title => "Title",
        :content => "MyText",
        :conference_id => 1
      )
    ])
  end

  it "renders a list of news" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
