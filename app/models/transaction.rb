class Transaction < ApplicationRecord
  validates :invoice_id, :credit_card_number, :result, presence: true
  belongs_to :invoice

  scope :successful, -> {where(result: 'success')}
  scope :not_successful, -> {where(result: 'failed')}
end
