class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :items
  has_many :invoices


  def self.most_x_revenue(number)
    joins(:invoices)
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .joins(invoices: [:invoice_items])
    .group(:id)
    .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
    .limit(number)
  end
end
