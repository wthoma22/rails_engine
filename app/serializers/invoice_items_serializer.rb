class InvoiceItemsSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :invoice_id

  belongs_to :invoice
  belongs_to :item
end
