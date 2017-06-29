class Api::V1::Items::ItemMerchantController < ApplicationController

  def show
    render json: Merchant.find((Item.find(params["id"]).merchant_id))
  end

end
