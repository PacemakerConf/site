require 'rails_helper'

RSpec.describe "news/edit", :type => :view do
  before(:each) do
    @news = assign(:news, News.create!(
      :title => "MyString",
      :content => "MyText",
      :conference_id => 1
    ))
  end

  it "renders the edit news form" do
    render

    assert_select "form[action=?][method=?]", news_path(@news), "post" do

      assert_select "input#news_title[name=?]", "news[title]"

      assert_select "textarea#news_content[name=?]", "news[content]"

      assert_select "input#news_conference_id[name=?]", "news[conference_id]"
    end
  end
end
