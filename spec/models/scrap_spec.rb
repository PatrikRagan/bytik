require 'spec_helper'

RSpec.describe Scrap, type: :model do
  it 'is invalid without a city' do
    scrap = Scrap.new(city: nil)
    expect(scrap).not_to be_valid
  end
end