require 'rails_helper'

context "GET /invoice/:id" do
  it "returns an invoice by id" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end
end
