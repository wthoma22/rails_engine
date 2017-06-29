class Api::V1::Merchants::IdRevenueController < ApplicationController

  def show
    render json: Invoice.merchant_revenue(params[:id]), serializer: RevenueSerializer
  end

  private

  def date
    params[:date].to_datetime if params[:date]
    params.permit(:date, :id)
  end

end
