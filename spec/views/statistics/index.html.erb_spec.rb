require 'spec_helper'

RSpec.describe "statistics/index", type: :view do
  before(:each) do
    assign(:statistics, [
      Statistic.create!(
        :suggested_price => 1,
        :result => "MyText"
      ),
      Statistic.create!(
        :suggested_price => 1,
        :result => "MyText"
      )
    ])
  end

  it "renders a list of statistics" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
