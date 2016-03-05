require "spec_helper"

describe ScrapsController do
  describe "routing" do

    it "routes to #index" do
      get("/scraps").should route_to("scraps#index")
    end

    it "routes to #new" do
      get("/scraps/new").should route_to("scraps#new")
    end

    it "routes to #show" do
      get("/scraps/1").should route_to("scraps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/scraps/1/edit").should route_to("scraps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/scraps").should route_to("scraps#create")
    end

    it "routes to #update" do
      put("/scraps/1").should route_to("scraps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/scraps/1").should route_to("scraps#destroy", :id => "1")
    end

  end
end
