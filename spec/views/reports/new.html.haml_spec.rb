require 'rails_helper'

RSpec.describe "reports/new", :type => :view do
  before(:each) do
    assign(:report, Report.new(
      :report => "MyString"
    ))
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

      assert_select "input#report_report[name=?]", "report[report]"
    end
  end
end
