require 'rails_helper'

describe "Customers API" do
  context "GET /api/v1/customers " do
    it 'sends a list of customers' do
      create_list(:customer, 3)

      get '/api/v1/customers'

      expect(response).to be_success

      customers = JSON.parse(response.body)
      customer = customers.first

      expect(customers.count).to eq(3)
      expect(customer).to have_key("first_name")
      expect(customer["first_name"]).to be_a String
    end
  end
end
