require "rails_helper"

RSpec.describe CarrinhosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/carrinhos").to route_to("carrinhos#index")
    end

    it "routes to #new" do
      expect(get: "/carrinhos/new").to route_to("carrinhos#new")
    end

    it "routes to #show" do
      expect(get: "/carrinhos/1").to route_to("carrinhos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/carrinhos/1/edit").to route_to("carrinhos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/carrinhos").to route_to("carrinhos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/carrinhos/1").to route_to("carrinhos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/carrinhos/1").to route_to("carrinhos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/carrinhos/1").to route_to("carrinhos#destroy", id: "1")
    end
  end
end
