require 'rails_helper'

context "GET /invoice_items/:id" do
  it "returns an invoice_items by id" do
    id = create(:invoice_items).id

    get "/api/v1/invoice_items/#{id}"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items["id"]).to eq(id)
  end
end
