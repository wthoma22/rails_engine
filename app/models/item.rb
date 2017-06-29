class Item < ApplicationRecord
  validates :name, :description, :unit_price, :merchant_id, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, :through => :invoice_items

  def self.top_x_sold(number)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:invoice_items)
    .group("items.id")
    .order("total_revenue DESC").limit(number)
  end

  def best_day
    { "best_day" => invoices.joins(:invoice_items)
    .order("invoice_items.quantity DESC, invoices.created_at DESC")
    .first.created_at}
  end
end
