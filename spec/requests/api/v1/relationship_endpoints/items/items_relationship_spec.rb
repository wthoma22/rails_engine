require 'rails_helper'

describe "Items relationship endpoints" do
  it "returns a list of invoice_items" do
    id = create(:item).id
    invoice_item = create(:invoice_item, item_id: id)
    get "/api/v1/items/#{id}/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items[0]["id"]).to eq(invoice_item.id)
  end

  it "returns the appropriate merchant" do
    merchant = create(:merchant).id
    id = create(:item, merchant_id: merchant).id

    get "/api/v1/items/#{id}/merchant"

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants["id"]).to eq(merchant)
  end
end
