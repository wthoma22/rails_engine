require 'rails_helper'
describe " GET /api/v1/merchants/:id/revenue?date=x" do
  context 'Get to the total revenue for specific merchant' do
    it 'returns the total revenue for that merchant for a specific invoice date x' do
      date = "2014-03-27T14:54:02.000Z"
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice,
                        merchant_id: merchant.id,
                        customer_id: customer.id,
                        created_at: date)
      create(:transaction, invoice_id: invoice.id)
      create(:invoice_item, invoice_id: invoice.id, unit_price: 1000, quantity: 5)

      get "/api/v1/merchants/#{merchant.id}/revenue?date=#{date}"

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue).to be_a Array
      expect(revenue.length).to eq(1)
      expect(revenue[0]["total_revenue"]).to eq(5000)
    end
  end
end
