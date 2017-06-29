require 'rails_helper'

describe "GET /api/v1/items/:id/best_day" do
  context "Get date with the most sales" do
    it "returns the date with the most sales for the given item using the invoice date" do
      item = create(:item)
      invoice_most_sales = create(:invoice)
      invoice_least_sales = create(:invoice)
      invoice_item_most_sales = create(:invoice_item,
                                        item_id: item.id,
                                        invoice_id: invoice_most_sales.id,
                                        quantity: 3,
                                        unit_price: 5)
      invoice_item_least_sales = create(:invoice_item,
                                        item_id: item.id,
                                        invoice_id: invoice_most_sales.id,
                                        quantity: 1,
                                        unit_price: 5)

      get "/api/v1/items/#{item.id}/best_day"
      date = JSON.parse(response.body)
      expected_date = invoice_most_sales.created_at.to_i
      actual_date = DateTime.parse(date["best_day"]).to_i

      expect(response).to be_success
      expect(date).to be_a Hash
      expect(actual_date).to eq(expected_date)
    end
  end
end
