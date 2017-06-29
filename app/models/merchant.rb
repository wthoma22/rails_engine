class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(quantity)
    joins(:invoices)
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .joins(invoices: [:invoice_items])
    .group(:id)
    .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
    .limit(quantity)
  end

  def self.most_items(quantity)
    joins(:invoices)
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .joins(invoices: [:invoice_items])
    .group(:id)
    .order('SUM(invoice_items.quantity) DESC')
    .limit(quantity)
  end

  def favorite_customer
    customers.select("customers.*, count(invoices.customer_id) as invoice_count")
      .joins(:transactions)
      .merge(Transaction.successful)
      .group(:id)
      .order("invoice_count desc").first
  end

  def customers_with_pending_invoices
  customers.joins("join transactions on transactions.invoice_id = invoices.id")
          .merge(Transaction.pending).distinct
  end
end
