require 'spec_helper'

# describe "" do
#   describe "GET /" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get scraps_path
#       response.status.should be(200)
#     end
#   end
# end


RSpec.describe "Scraps", type: :request do
  describe "GET /scraps" do
    before do
      sign_in_as_a_valid_user_request
    end
    it "works! (now write some real specs)" do
      get scraps_path
      expect(response).to have_http_status(200)
    end
  end
end
# end
