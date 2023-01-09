require "rails_helper"

describe "GET /apartments" do
    it "renders index of apartments", type: :request do
      get "/apartments"
      expect(response).to be_successful
    end
  end
