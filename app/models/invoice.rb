class Invoice < ApplicationRecord
  validates :customer_id, :status, :merchant_id, presence: true

  has_many :transactions
  has_many :invoice_items
  belongs_to :customer
  belongs_to :merchant
end
