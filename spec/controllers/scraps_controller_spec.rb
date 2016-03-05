require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ScrapsController do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # Scrap. As you add validations to Scrap, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {
      city: 'Kosice',
      room_count: 3,
      part_of_town: 'Zapad'
  } }

  let(:invalid_attributes) {
    # {
    #   # city: nil,
    #   room_count: 3,
    #   part_of_town: 'Zapad'
    # }
    skip("Add a hash of attributes invalid for your model")
  }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ScrapsController. Be sure to keep this updated too.
  let(:valid_session) {
    {}
  }

  describe "GET index" do
    it "assigns all scraps as @scraps" do
      scrap = Scrap.create! valid_attributes
      get :index, {}, valid_session
      assigns(:scraps).should eq([scrap])
    end

    it "should get index" do
      # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
      # the valid_session overrides the devise login. Remove the valid_session from your specs
      get 'index'
      # route_defined?('index')
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested scrap as @scrap" do
      scrap = Scrap.create! valid_attributes
      get :show, {:id => scrap.to_param}, valid_session
      assigns(:scrap).should eq(scrap)
    end
  end

  describe "GET new" do
    it "assigns a new scrap as @scrap" do
      get :new, {}, valid_session
      assigns(:scrap).should be_a_new(Scrap)
    end
  end

  describe "GET edit" do
    it "assigns the requested scrap as @scrap" do
      scrap = Scrap.create! valid_attributes
      get :edit, {:id => scrap.to_param}, valid_session
      assigns(:scrap).should eq(scrap)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Scrap" do
        expect {
          post :create, {:scrap => valid_attributes}, valid_session
        }.to change(Scrap, :count).by(1)
      end

      it "assigns a newly created scrap as @scrap" do
        post :create, {:scrap => valid_attributes}, valid_session
        assigns(:scrap).should be_a(Scrap)
        assigns(:scrap).should be_persisted
      end

      it "redirects to the created scrap" do
        post :create, {:scrap => valid_attributes}, valid_session
        response.should redirect_to(Scrap.last)
      end
    end

    # describe "with invalid params" do
    #   it "assigns a newly created but unsaved scrap as @scrap" do
    #     # Trigger the behavior that occurs when invalid params are submitted
    #     Scrap.any_instance.stub(:save).and_return(false)
    #     post :create, {:scrap => {}}, valid_session
    #     assigns(:scrap).should be_a_new(Scrap)
    #   end
    #
    #   it "re-renders the 'new' template" do
    #     # Trigger the behavior that occurs when invalid params are submitted
    #     Scrap.any_instance.stub(:save).and_return(false)
    #     post :create, {:scrap => {}}, valid_session
    #     response.should render_template("new")
    #   end
    # end

    describe "with invalid params" do
      it "assigns a newly created but unsaved statistic as @statistic" do
        # post :create, {:statistic => invalid_attributes}
        # expect(assigns(:statistic)).to be_a_new(Scrap)
        expect(post :create, {:statistic => invalid_attributes}).to respond_with 400
        # is_expected.to respond_with 400
      end

      it "re-renders the 'new' template" do
        post :create, {:statistic => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested statistic" do
        statistic = Scrap.create! valid_attributes
        put :update, {:id => statistic.to_param, :scrap => new_attributes}, valid_session
        statistic.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested statistic as @statistic" do
        statistic = Scrap.create! valid_attributes
        put :update, {:id => statistic.to_param, :scrap => valid_attributes}, valid_session
        expect(assigns(:scrap)).to eq(statistic)
      end

      it "redirects to the statistic" do
        statistic = Scrap.create! valid_attributes
        put :update, {:id => statistic.to_param, :scrap => valid_attributes}, valid_session
        expect(response).to redirect_to(statistic)
      end
    end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested scrap" do
  #       scrap = Scrap.create! valid_attributes
  #       # Assuming there are no other scraps in the database, this
  #       # specifies that the Scrap created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Scrap.any_instance.should_receive(:update).with({"these" => "params"})
  #       put :update, {:id => scrap.to_param, :scrap => {"these" => "params"}}, valid_session
  #     end
  #
  #     it "assigns the requested scrap as @scrap" do
  #       scrap = Scrap.create! valid_attributes
  #       put :update, {:id => scrap.to_param, :scrap => valid_attributes}, valid_session
  #       assigns(:scrap).should eq(scrap)
  #     end
  #
  #     it "redirects to the scrap" do
  #       scrap = Scrap.create! valid_attributes
  #       put :update, {:id => scrap.to_param, :scrap => valid_attributes}, valid_session
  #       response.should redirect_to(scrap)
  #     end
  #   end
  #
  #   describe "with invalid params" do
  #     it "assigns the scrap as @scrap" do
  #       scrap = Scrap.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Scrap.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => scrap.to_param, :scrap => {}}, valid_session
  #       assigns(:scrap).should eq(scrap)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       scrap = Scrap.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Scrap.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => scrap.to_param, :scrap => {}}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  end

  describe "DELETE destroy" do
    it "destroys the requested scrap" do
      scrap = Scrap.create! valid_attributes
      expect {
        delete :destroy, {:id => scrap.to_param}, valid_session
      }.to change(Scrap, :count).by(-1)
    end

    it "redirects to the scraps list" do
      scrap = Scrap.create! valid_attributes
      delete :destroy, {:id => scrap.to_param}, valid_session
      response.should redirect_to(scraps_url)
    end
  end

end
