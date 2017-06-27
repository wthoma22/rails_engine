class Customer < ApplicationRecord
  validates :first_name, :last_name, presenct: true

  has_many :invoices
end
