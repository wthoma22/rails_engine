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

    it "returns revenue across all merchants for a specific date" do
      merchant = create(:merchant).id
      merchant2 = create(:merchant).id
      item_1 = create(:item, merchant_id: merchant)
      item_2 = create(:item, merchant_id: merchant2)
      date = "2012-03-16 11:55:05"
      invoice_1 = create(:invoice, merchant_id: merchant, created_at: date)
      transaction_1 = create(:transaction, invoice_id: invoice_1.id)
      invoice_2 = create(:invoice, merchant_id: merchant2, created_at: date)
      transaction_2 = create(:transaction, invoice_id: invoice_2.id)
      invoice_item_1 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id)
      invoice_item_2 = create(:invoice_item,
                                item_id: item_1.id,
                                invoice_id: invoice_1.id,
                                quantity: 1000,
                                unit_price: 1000)
      get "/api/v1/merchants/revenue?date=#{date}"

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue).to be_a Array
      expect(revenue.length).to eq(1)
      expect(revenue[0]["total_revenue"]).to eq(1000015)
    end
  end
end
