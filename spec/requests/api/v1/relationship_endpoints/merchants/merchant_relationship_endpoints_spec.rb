require 'rails_helper'

describe "customer relationship endpoints" do
  it "returns invoices" do
      merchant = create(:merchant).id
      item_1 = create(:item, merchant_id: merchant).id
      item_2 = create(:item, merchant_id: merchant).id

      get "/api/v1/merchants/#{merchant}/items"

      expect(response).to be_success

      items = JSON.parse(response.body)

      expect(items[0]["id"]).to eq(item_1)
      expect(items[1]["id"]).to eq(item_2)
  end

  it "returns invoices" do
    merchant = create(:merchant).id
    invoice_1 = create(:invoice, merchant_id: merchant).id
    invoice_2 = create(:invoice, merchant_id: merchant).id

    get "/api/v1/merchants/#{merchant}/invoices"

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices[0]["id"]).to eq(invoice_1)
    expect(invoices[1]["id"]).to eq(invoice_2)
  end
end
