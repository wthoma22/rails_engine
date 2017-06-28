class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    render json: Item.top_x_sold(params["quantity"])
  end
end
