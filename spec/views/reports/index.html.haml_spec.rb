require 'rails_helper'

RSpec.describe "reports/index", :type => :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :report => "Report"
      ),
      Report.create!(
        :report => "Report"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => "Report".to_s, :count => 2
  end
end
