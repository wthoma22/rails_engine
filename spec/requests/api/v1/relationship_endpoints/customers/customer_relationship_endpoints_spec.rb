require 'rails_helper'

describe "customer relationship endpoints" do
  it "returns invoices" do
      customer = create(:customer).id
      id1 = create(:invoice, customer_id: customer).id
      id2 = create(:invoice, customer_id: customer).id

      get "/api/v1/customers/#{customer}/invoices"

      expect(response).to be_success

      invoices = JSON.parse(response.body)

      expect(invoices[0]["id"]).to eq(id1)
      expect(invoices[1]["id"]).to eq(id2)
  end

  it "returns transactions" do
    customer = create(:customer).id
    invoice_1 = create(:invoice, customer_id: customer).id
    invoice_2 = create(:invoice, customer_id: customer).id
    transaction_1 = create(:transaction, invoice_id: invoice_1).id
    transaction_2 = create(:transaction, invoice_id: invoice_2).id

    get "/api/v1/customers/#{customer}/transactions"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions[0]["id"]).to eq(transaction_1)
    expect(transactions[1]["id"]).to eq(transaction_2)

  end
end
