require 'rails_helper'

describe "Transaction API" do
  context "GET /api/v1/transactions" do
    it "sends a list of transactions" do
      create_list(:transaction, 3)

      get '/api/v1/transactions'

      expect(response).to have_http_status(200)

      transactions = JSON.parse(response.body)
      transaction = transactions.first

      expect(transactions.count).to eq(3)
      expect(transaction).to have_key("credit_card_number")
      expect(transaction["credit_card_number"]).to be_a String
      expect(transaction).to have_key("result")
      expect(transaction["result"]).to be_a String
      expect(transaction).to have_key("invoice_id")
      expect(transaction["invoice_id"]).to be_a Integer
    end
  end

  context "GET /api/v1/transactins/:id" do
    it "can get one transaction by id" do
      id = create(:transaction).id

      get "/api/v1/transactions/#{id}"

      transaction = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(transaction).to have_key("credit_card_number")
      expect(transaction["credit_card_number"]).to be_a String
      expect(transaction).to have_key("result")
      expect(transaction["result"]).to be_a String
      expect(transaction).to have_key("invoice_id")
      expect(transaction["invoice_id"]).to be_a Integer
    end
  end
end
