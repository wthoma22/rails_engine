require 'rails_helper'

describe "items API" do
  context "find by" do
    let!(:item_1) { create(:item) }

    it "finds item by id" do
      id = (item_1).id

      get '/api/v1/items/find', params: { id: id }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq(id)
    end

    it 'finds item by merchant_id' do
      merchant_id = item_1.merchant_id

      get '/api/v1/items/find', params: { merchant_id: merchant_id }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['merchant_id']).to eq(merchant_id)
    end

    it 'finds item by name' do
      name = item_1.name

      get '/api/v1/items/find', params: { name: name }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq(name)
    end

    it 'finds item by description' do
      description = item_1.description

      get '/api/v1/items/find', params: { description: description }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['description']).to eq(description)
    end

    it "finds item by unit_price" do
      unit_price = create(:item, unit_price: 35500)

      get '/api/v1/items/find', params: { unit_price: 355 }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['unit_price']).to eq("355.0")
    end

    it "finds item from creation date" do
      created_at = item_1.created_at
      id= item_1.id

      get '/api/v1/items/find', params: { created_at: created_at }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq(id)
    end

    it 'finds item from updated date' do
      updated_at = item_1.updated_at
      id = item_1.id

      get '/api/v1/items/find', params: { updated_at: updated_at }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq(id)
    end

    it 'random item' do
      create_list(:item, 10)

      get '/api/v1/items/random'
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end
