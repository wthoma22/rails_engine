class Api::V1::Invoices::FindController < ApplicationController
  def index
    render json: Invoice.all
  end

  def show
    render json: Invoice.find_by(transaction_params)
  end

private

  def transaction_params
    # date_search = {}
    # date_search[:created_at] = params[:created_at].to_datetime if params[:created_at]
    # date_search[:updated_at] = params[:updated_at].to_datetime if params[:updated_at]
    params.permit(:id, :customer_id, :status, :merchant_id, :created_at, :updated_at)
  end
end
