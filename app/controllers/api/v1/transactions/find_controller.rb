class Api::V1::Transactions::FindController < ApplicationController
  def index
    render json: Transaction.all
  end

  def show
    render json: Transaction.find_by(transaction_params)
  end

private

  def transaction_params
    date_search = {}
    date_search[:created_at] = params[:created_at].to_datetime if params[:created_at]
    date_search[:updated_at] = params[:updated_at].to_datetime if params[:updated_at]
    params.permit(:id, :invoice_id, :credit_card_number, :result).merge(date_search)
  end
end
