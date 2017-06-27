require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 2)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    first_item = items.first

    expect(items.count).to eq(2)
    expect(first_item).to have_key("name")
    expect(first_item).to have_key("description")
    expect(first_item).to have_key("unit_price")
  end
end
