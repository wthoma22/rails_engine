class Api::V1::Transactions::InvoiceController < ApplicationController

  def show
    render json: Invoice.find((Transaction.find(params[:id]).invoice_id))
  end

end
