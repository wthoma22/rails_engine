class Api::V1::Items::FindController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find_by(item_params)
  end

private

  def item_params
    # date_search = {}
    # date_search[:created_at] = params[:created_at].to_datetime if params[:created_at]
    # date_search[:updated_at] = params[:updated_at].to_datetime if params[:updated_at]
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
