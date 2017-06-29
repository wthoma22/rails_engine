require 'rails_helper'

describe 'GET /api/v1/merchants/:id/revenue' do
    context 'Get revenue for specific merchant by transactions' do
      it 'returns the total revenue for that merchant across all transactions' do
        merchant = create(:merchant)
        customer = create(:customer)
        invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
        create(:transaction, invoice_id: invoice.id)
        create(:invoice_item, invoice_id: invoice.id, unit_price: 1000, quantity: 5)

        get "/api/v1/merchants/#{merchant.id}/revenue"

        revenue = JSON.parse(response.body)

        expect(revenue["total_revenue"]).to eq(5000)
      end
    end
  end
