class Api::V1::Merchants::IdRevenueController < ApplicationController

  def show
    render json: Invoice.revenue(datetime), each_serializer: TotalRevenueSerializer
  end

  private

  def datetime
    params[:date].to_datetime if params[:date]
  end

end
