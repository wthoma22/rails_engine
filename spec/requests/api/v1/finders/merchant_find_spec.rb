require 'rails_helper'

describe "Merchants API" do
  context "find by" do
    let!(:merchant) { create(:merchant) }

    it "finds item by id" do
      id = (merchant).id

      get '/api/v1/merchants/find', params: { id: id }
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['id']).to eq(id)
    end

    it 'finds merchant by name' do
      name = merchant.name

      get '/api/v1/merchants/find', params: { name: name }
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq(name)
    end

    it "finds merchant from creation date" do
      created_at = merchant.created_at

      get '/api/v1/merchants/find', params: { created_at: created_at }
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['created_at']).to eq("2014-03-27T14:54:02.000Z")
    end

    it 'finds merchant from updated date' do
      updated_at = merchant.updated_at

      get '/api/v1/merchants/find', params: { updated_at: updated_at }
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['updated_at']).to eq("2014-03-27T14:54:02.000Z")
    end

    it 'random merchant' do
      create_list(:merchant, 10)

      get '/api/v1/merchants/random'
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end
