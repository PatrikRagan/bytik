require 'spec_helper'

RSpec.describe "statistics/show", type: :view do
  before(:each) do
    @statistic = assign(:statistic, Statistic.create!(
      :suggested_price => 1,
      :result => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
