require 'rails_helper'

describe "Transaction API" do
  context "find by" do
    let!(:transaction) { create(:transaction) }

    it "finds transaction by id" do
      id = (transaction).id

      get '/api/v1/transactions/find', params: { id: id }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq(id)
    end

    it "finds transaction by invoice_id" do
      invoice_id = transaction.invoice_id

      get '/api/v1/transactions/find', params: { invoice_id: invoice_id }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['invoice_id']).to eq(invoice_id)
    end

    it 'finds transaction by credit card number' do
      credit_card_number = transaction.credit_card_number

      get '/api/v1/transactions/find', params: { credit_card_number: credit_card_number }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['credit_card_number']).to eq(credit_card_number)
    end

    it 'finds transaction by result' do
      result = transaction.result

      get '/api/v1/transactions/find', params: { result: result }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq(result)
    end

    it "finds transaction from creation date" do
      created_at = transaction.created_at

      get '/api/v1/transactions/find', params: { created_at: created_at }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['created_at']).to eq("2014-03-27T14:54:02.000Z")
    end

    it 'finds transaction from updated date' do
      updated_at = transaction.updated_at

      get '/api/v1/transactions/find', params: { updated_at: updated_at }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['updated_at']).to eq("2014-03-27T14:54:02.000Z")
    end
  end
end
