require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:invoice, 1)

    get '/api/v1/invoices'

    expect(response).to be_success

    items = JSON.parse(response.body)
    first_item = items.first

    expect(items.count).to eq(1)
    expect(first_item).to have_key("status")
  end
end
