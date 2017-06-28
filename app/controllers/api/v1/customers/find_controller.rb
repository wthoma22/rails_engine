class Api::V1::Customers::FindController < ApplicationController
  def index
    render json: Customer.where(customer_params)
  end

  def show
    render json: Customer.find_by(customer_params)
  end

private

  def customer_params
    date_search = {}
    date_search[:created_at] = params[:created_at].to_datetime if params[:created_at]
    date_search[:updated_at] = params[:updated_at].to_datetime if params[:updated_at]
    params.permit(:id, :first_name, :last_name).merge(date_search)
  end
end
