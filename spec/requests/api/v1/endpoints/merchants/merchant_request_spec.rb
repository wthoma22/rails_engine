require 'rails_helper'

describe "Merchant API" do
  context "GET /api/v1/merchants" do
    it "sends a list of merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to have_http_status(200)

      merchants = JSON.parse(response.body)
      merchant = merchants.first

      expect(merchants.count).to eq(3)
      expect(merchant).to have_key("name")
      expect(merchant["name"]).to be_a String
    end
  end

  context "GET /merchants/:id" do
    it "can get one merchant by its id" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(merchant).to have_key("name")
      expect(merchant["name"]).to be_a String
    end
  end

end
