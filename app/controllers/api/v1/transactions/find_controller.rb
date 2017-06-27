class Api::V1::Transactions::FindController < ApplicationController
  def index
    render json: Transaction.all
  end

  def show
    render json: Transaction.find_by(transaction_params)
  end

private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
  end
end
