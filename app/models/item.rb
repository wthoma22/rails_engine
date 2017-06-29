class Item < ApplicationRecord
  validates :name, :description, :unit_price, :merchant_id, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, :through => :invoice_items

  def self.top_x_sold(number)
    unscoped
    .joins(:invoice_items)
    .group(:id)
    .order("sum(invoice_items.quantity) DESC")
    .limit(number)
  end

  def best_day
      { "best_day" => invoices
      .joins(:invoice_items)
      .group(:id)
      .group(:created_at)
      .order("sum(invoice_items.quantity) DESC")
      .first
      .created_at }
  end
end
