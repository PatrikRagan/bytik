require 'spec_helper'

RSpec.describe "Statistics", type: :request do
  describe "GET /statistics" do
    before do
      sign_in_as_a_valid_user_request
    end
    it "works! (now write some real specs)" do
      get statistics_path
      expect(response).to have_http_status(200)
    end
  end

end
