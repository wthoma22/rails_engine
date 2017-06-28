class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

private

  def invoice_item_params
    # date_search = {}
    # date_search[:created_at] = params[:created_at].to_datetime if params[:created_at]
    # date_search[:updated_at] = params[:updated_at].to_datetime if params[:updated_at]
    params.permit(:id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
  end
end
