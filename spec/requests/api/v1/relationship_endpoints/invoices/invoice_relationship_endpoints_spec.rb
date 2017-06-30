require 'rails_helper'

describe "invoice relationship endpoints" do
  it "returns transactions" do
      invoice_id = create(:invoice).id

      id1 = create(:transaction, invoice_id: invoice_id).id
      id2 = create(:transaction, invoice_id: invoice_id).id

      get "/api/v1/invoices/#{invoice_id}/transactions"

      expect(response).to be_success

      transactions = JSON.parse(response.body)

      expect(transactions[0]["id"]).to eq(id1)
      expect(transactions[1]["id"]).to eq(id2)
  end

  it "returns invoice_items" do
    invoice_id = create(:invoice).id

    id1 = create(:invoice_item, invoice_id: invoice_id).id
    id2 = create(:invoice_item, invoice_id: invoice_id).id
    id3 = create(:invoice_item).id

    get "/api/v1/invoices/#{invoice_id}/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items[0]["id"]).to eq(id1)
    expect(invoice_items[1]["id"]).to eq(id2)

    expect(invoice_items[0]["id"]).to_not eq(id3)
    expect(invoice_items[1]["id"]).to_not eq(id3)
  end

  it "returns items" do
    invoice_id = create(:invoice).id
    item = create(:item).id
    item2 = create(:item).id
    id1 = create(:invoice_item, invoice_id: invoice_id, item_id: item).id
    id2 = create(:invoice_item, invoice_id: invoice_id, item_id: item).id
    id3 = create(:invoice_item).id

    get "/api/v1/invoices/#{invoice_id}/items"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items[0]["id"]).to eq(item)
    expect(items[1]["id"]).to eq(item)

    expect(items[0]["id"]).to_not eq(item2)
    expect(items[1]["id"]).to_not eq(item2)
  end

  it "returns customer" do
      customer_id = create(:customer).id
      customer2 = create(:customer).id
      invoice_id = create(:invoice, customer_id: customer_id).id

      get "/api/v1/invoices/#{invoice_id}/customer"

      expect(response).to be_success

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(customer_id)

      expect(customer["id"]).to_not eq(customer2)
  end

  it "returns merchant" do
    merchant_id = create(:merchant).id
    merchant2 = create(:merchant).id
    invoice_id = create(:invoice, merchant_id: merchant_id).id

    get "/api/v1/invoices/#{invoice_id}/merchant"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(merchant_id)

    expect(merchant["id"]).to_not eq(merchant2)
  end
end
