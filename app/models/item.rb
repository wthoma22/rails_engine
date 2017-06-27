class Item < ApplicationRecord
  validates :name, :description, :unit_price, :merchant_id, presence: true

  has_many :invoice_items
  belongs_to :merchant
end
