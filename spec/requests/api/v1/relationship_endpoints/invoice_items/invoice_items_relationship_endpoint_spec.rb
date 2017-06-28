require 'rails_helper'

describe "invoice_items relationship endpoints" do
  it "returns invoice" do
    id = create(:item).id
    invoice_id = create(:invoice).id
    invoice_item = create(:invoice_item, item_id: id, invoice_id: invoice_id).id
    get "/api/v1/invoice_items/#{invoice_item}/invoice"

    expect(response).to be_success

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_id)
  end

  it "returns invoice item" do
    id = create(:item).id
    invoice_id = create(:invoice).id
    invoice_item = create(:invoice_item, item_id: id, invoice_id: invoice_id).id
    get "/api/v1/invoice_items/#{invoice_item}/item"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(id)
  end

end
