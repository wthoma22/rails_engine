class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    render json: Invoice.revenue(datetime), serializer: TotalRevenueSerializer
  end

  private

  def datetime
    params[:date].to_datetime if params[:date]
  end

end
