class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at

  belongs_to :invoice
  belongs_to :item
end
