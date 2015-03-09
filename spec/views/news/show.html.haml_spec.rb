require 'rails_helper'

RSpec.describe "news/show", :type => :view do
  before(:each) do
    @news = assign(:news, News.create!(
      :title => "Title",
      :content => "MyText",
      :conference_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
