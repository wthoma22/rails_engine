class Api::V1::InvoiceItems::InvoiceController < ApplicationController

  def show
    render json: Invoice.find((InvoiceItem.find(params[:id]).invoice_id))
  end

end
