require 'rails_helper'

describe "customers API" do
  context "find by" do
    let!(:customer_1) { create(:customer) }

    it "finds customer by id" do
      id = (customer_1).id

      get '/api/v1/customers/find', params: { id: id }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['id']).to eq(id)
    end

    it "finds customer by first name" do
      first_name = customer_1.first_name

      get '/api/v1/customers/find', params: { first_name: first_name }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq(first_name)
    end

    it 'finds customer by last name' do
      last_name = customer_1.last_name

      get '/api/v1/customers/find', params: { last_name: last_name }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['last_name']).to eq(last_name)
    end

    it "finds customer from creation date" do
      created_at = customer_1.created_at

      get '/api/v1/customers/find', params: { created_at: created_at }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['created_at']).to eq("2014-03-27T14:54:02.000Z")
    end

    it 'finds customer from updated date' do
      updated_at = customer_1.updated_at

      get '/api/v1/customers/find', params: { updated_at: updated_at }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['updated_at']).to eq("2014-03-27T14:54:02.000Z")
    end
  end
end
