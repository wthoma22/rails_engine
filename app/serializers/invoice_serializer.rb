class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :status, :merchant_id, :created_at, :updated_at

  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :transactions
end
