require 'rails_helper'

RSpec.describe "reports/show", :type => :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :report => "Report"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Report/)
  end
end
