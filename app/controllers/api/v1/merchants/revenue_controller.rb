class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    render json: Invoice.revenue(datetime), each_serializer: TotalRevenueSerializer
  end

  private

  def datetime
    params[:date].to_datetime
  end

end
