require 'spec_helper'

RSpec.describe "statistics/edit", type: :view do
  before(:each) do
    @statistic = assign(:statistic, Statistic.create!(
      :suggested_price => 1,
      :result => "MyText"
    ))
  end

  it "renders the edit statistic form" do
    render

    assert_select "form[action=?][method=?]", statistic_path(@statistic), "post" do

      assert_select "input#statistic_suggested_price[name=?]", "statistic[suggested_price]"

      assert_select "textarea#statistic_result[name=?]", "statistic[result]"
    end
  end
end
