class InvoiceItems < ApplicationRecord
  validates :quantity, :unit_price, presence: true

  belongs_to :invoices
  belongs_to :items
end
