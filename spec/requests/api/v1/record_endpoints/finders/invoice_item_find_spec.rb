require 'rails_helper'

describe "invoice_items API" do
  context "find by" do
    let!(:invoice_items_1) { create(:invoice_item) }

    it "finds invoice_items by id" do
      id = (invoice_items_1).id

      get '/api/v1/invoice_items/find', params: { id: id }
      invoice_items = JSON.parse(response.body)
      expect(response).to be_success
      expect(invoice_items['id']).to eq(id)
    end

    it "finds invoice_items by quantity" do
      quantity = invoice_items_1.quantity

      get '/api/v1/invoice_items/find', params: { quantity: quantity }
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['quantity']).to eq(quantity)
    end

    it 'finds invoice_items by unit_price' do
      item = create(:item, unit_price: 33500)
      invoice_item = create(:invoice_item, item_id: item.id, unit_price: item.unit_price)


      get '/api/v1/invoice_items/find', params: { unit_price: 335 }
      invoice_items = JSON.parse(response.body)
      expect(response).to be_success
      expect(invoice_items['unit_price']).to eq("335.0")
    end

    it 'finds invoice_items by item_id' do
      item_id = invoice_items_1.item_id

      get '/api/v1/invoice_items/find', params: { item_id: item_id }
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['item_id']).to eq(item_id)
    end

    it 'finds invoice_items by invoice_id' do
      invoice_id = invoice_items_1.invoice_id

      get '/api/v1/invoice_items/find', params: { invoice_id: invoice_id }
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['invoice_id']).to eq(invoice_id)
    end

    it "finds invoice_items from creation date" do
      created_at = invoice_items_1.created_at
      id = invoice_items_1.id

      get '/api/v1/invoice_items/find', params: { created_at: created_at }
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['id']).to eq(id)
    end

    it 'finds invoice_items from updated date' do
      updated_at = invoice_items_1.updated_at
      id = invoice_items_1.id

      get '/api/v1/invoice_items/find', params: { updated_at: updated_at }
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items['id']).to eq(id)
    end

    it 'find all invoice items by attribute' do
      id = (invoice_items_1).id

      get '/api/v1/invoice_items/find_all', params: { id: id }
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success

      expect(invoice_items.count).to eq(1)
    end

    it 'random invoice_items' do
      create_list(:invoice_item, 10)

      get '/api/v1/invoice_items/random'
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end
