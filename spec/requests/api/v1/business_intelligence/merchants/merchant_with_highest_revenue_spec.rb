require 'rails_helper'

describe "GET /api/v1/merchants/most_revenue?quantity=x" do
  context "Get merchant with most revenue" do
    it "returns the top x merchants ranked by total revenue generated" do
      merchant = create(:merchant).id
      merchant2 = create(:merchant).id
      item_1 = create(:item, merchant_id: merchant)
      item_2 = create(:item, merchant_id: merchant2)
      invoice_1 = create(:invoice, merchant_id: merchant)
      transaction_1 = create(:transaction, invoice_id: invoice_1.id)
      invoice_2 = create(:invoice, merchant_id: merchant2)
      transaction_2 = create(:transaction, invoice_id: invoice_2.id)
      invoice_item_1 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id)
      invoice_item_2 = create(:invoice_item,
                                item_id: item_1.id,
                                invoice_id: invoice_1.id,
                                quantity: 100,
                                unit_price: 1000)
      quantity = 2
      get "/api/v1/merchants/most_revenue?quantity=#{quantity}"

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants).to be_a Array
      expect(merchants.length).to eq(2)
      expect(merchants.first["id"]).to eq(merchant)
      expect(merchants.last["id"]).to eq(merchant2)

    end
    it "returns merchant with most items sold" do
      merchant = create(:merchant).id
      merchant2 = create(:merchant).id
      item_1 = create(:item, merchant_id: merchant)
      item_2 = create(:item, merchant_id: merchant2)
      invoice_1 = create(:invoice, merchant_id: merchant)
      transaction_1 = create(:transaction, invoice_id: invoice_1.id)
      invoice_2 = create(:invoice, merchant_id: merchant2)
      transaction_2 = create(:transaction, invoice_id: invoice_2.id)
      invoice_item_1 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id)
      invoice_item_2 = create(:invoice_item,
                                item_id: item_1.id,
                                invoice_id: invoice_1.id,
                                quantity: 1000,
                                unit_price: 1000)
      quantity = 2
      get "/api/v1/merchants/most_items?quantity=#{quantity}"

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants).to be_a Array
      expect(merchants.length).to eq(2)
      expect(merchants.first["id"]).to eq(merchant)
      expect(merchants.last["id"]).to eq(merchant2)
    end
  end
end
