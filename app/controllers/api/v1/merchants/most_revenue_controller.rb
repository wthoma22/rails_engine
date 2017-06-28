class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    render json: Merchant.most_x_revenue(params["quantity"])
  end

end

Item.select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
.joins(:invoice_items)
.group("items.id")
.order("total_revenue DESC")
.limit(5).first.total_revenue
