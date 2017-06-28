require 'rails_helper'

describe "GET /api/v1/merchants/most_revenue" do
  context "Get item with most revenue" do
    it "returns the top x items ranked by total revenue generated" do
      item_1 = create(:item)
      item_2 = create(:item)
      invoice = create(:invoice)
      invoice_item_1 = create(:invoice_items)
      invoice_item_2 = create(:invoice_items,
                                item_id: item_1.id,
                                invoice_id: invoice.idea,
                                quantity: 10,
                                unit_price: 1000)
      create(:transaction, invoice_id: invoice.id, result: "success")

      get "/api/v1/items/most_revenue?quantity=2"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items).to be_a Array
      expect(items.length).to eq(2)
      expect(items.first["id"]).to eq(item_1.id)
      expect(items.last["id"]).to eq(item_2.id)
    end
  end
end
