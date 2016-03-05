require 'spec_helper'

RSpec.describe "statistics/new", type: :view do
  before(:each) do
    assign(:statistic, Statistic.new(
      :suggested_price => 1,
      :result => "MyText"
    ))
  end

  it "renders new statistic form" do
    render

    assert_select "form[action=?][method=?]", statistics_path, "post" do

      assert_select "input#statistic_suggested_price[name=?]", "statistic[suggested_price]"

      assert_select "textarea#statistic_result[name=?]", "statistic[result]"
    end
  end
end
