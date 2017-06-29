require 'rails_helper'

describe "transaction relationship endpoints" do
  it "returns invoice" do
      invoice_id = create(:invoice).id
      id = create(:transaction, invoice_id: invoice_id).id
      get "/api/v1/transactions/#{id}/invoice"

      expect(response).to be_success

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(invoice_id)
  end
end
