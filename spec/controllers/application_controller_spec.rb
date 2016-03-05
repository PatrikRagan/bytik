require 'spec_helper'
describe ApplicationController do

  it 'redirects user to pending admin entries path' do
    expect(controller.after_sign_in_path_for(:user)).to eq scrap_path
  end

  describe "GET index after login" do
    login_user

    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end
  end
end
