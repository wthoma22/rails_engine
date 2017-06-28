class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    binding.pry
    render json: Customer.find(params[:id]).favorite_merchant
  end

end
