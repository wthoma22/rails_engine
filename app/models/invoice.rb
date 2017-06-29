class Invoice < ApplicationRecord
  validates :customer_id, :status, :merchant_id, presence: true

  has_many :transactions

  belongs_to :customer
  belongs_to :merchant

  has_many :invoice_items
  has_many :items, :through =>  :invoice_items

  def self.most_expensive_invoices(limit=5)
    select("invoice.*, sum(invoice_items.quantity * invoice_items.price) AS total_revenue")
      .joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .group("invoice.id")
      .order("total_revenue DESC")
      .limit(limit)
      # .where(transactions: { result: "success"})
  end

 def self.revenue(date)
   joins(:invoice_items)
   .where("invoices.created_at = ? ", date)
   .sum("invoice_items.unit_price * invoice_items.quantity")
  end
end
