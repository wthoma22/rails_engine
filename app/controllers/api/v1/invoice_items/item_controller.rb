class Api::V1::InvoiceItems::ItemController < ApplicationController

  def show
    render json: Item.find((InvoiceItem.find(params[:id]).item_id))
  end

end
