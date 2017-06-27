require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:invoice_items, 5)

    get '/api/v1/invoice_items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    first_item = items.first

    expect(items.count).to eq(5)

    expect(first_item).to have_key("quantity")
    expect(first_item).to have_key("unit_price")
    expect(first_item).to have_key("invoice_id")
    expect(first_item).to have_key("item_id")
  end
end
