class InvoiceItem < ApplicationRecord
  validates :quantity, :unit_price, :item_id, :invoice_id, presence: true

  belongs_to :invoice
  belongs_to :item
end
