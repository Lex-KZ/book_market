require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/books/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /restricted" do
    it "returns http success" do
      get "/books/restricted"
      expect(response).to have_http_status(:success)
    end
  end

end
