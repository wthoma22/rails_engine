class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id, :updated_at, :created_at

  belongs_to :merchant
  has_many :invoice_items
  # has_many :invoice, through: :invoice_items
end
