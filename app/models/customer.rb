class Customer < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants
    .select("merchants.*, count(invoices.merchant_id) as invoice_count")
    .joins(:transactions)
    .where(transactions: {:result => 'success'})
    .group(:id).order("invoice_count desc").first
  end
end
