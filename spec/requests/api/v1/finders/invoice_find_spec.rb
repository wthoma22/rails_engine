require 'rails_helper'

describe "invoices API" do
  context "find by" do
    let!(:invoice_1) { create(:invoice) }

    it "finds invoice by id" do
      id = (invoice_1).id

      get '/api/v1/invoices/find', params: { id: id }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq(id)
    end

    it "finds invoice by customer_id" do
      customer_id = invoice_1.customer_id

      get '/api/v1/invoices/find', params: { customer_id: customer_id }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['customer_id']).to eq(customer_id)
    end

    it 'finds invoice by customer_id' do
      customer_id = invoice_1.customer_id

      get '/api/v1/invoices/find', params: { customer_id: customer_id }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['customer_id']).to eq(customer_id)
    end

    it 'finds invoice by merchant_id' do
      merchant_id = invoice_1.merchant_id

      get '/api/v1/invoices/find', params: { merchant_id: merchant_id }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['merchant_id']).to eq(merchant_id)
    end

    it 'finds invoice by status' do
      status = invoice_1.status

      get '/api/v1/invoices/find', params: { status: status }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['status']).to eq(status)
    end

    it "finds invoice from creation date" do
      created_at = invoice_1.created_at

      get '/api/v1/invoices/find', params: { created_at: created_at }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['created_at']).to eq("2014-03-27T14:54:02.000Z")
    end

    it 'finds invoice from updated date' do
      updated_at = invoice_1.updated_at

      get '/api/v1/invoices/find', params: { updated_at: updated_at }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['updated_at']).to eq("2014-03-27T14:54:02.000Z")
    end
  end
end
