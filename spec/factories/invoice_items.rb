FactoryGirl.define do
  factory :invoice_items do
    quantity 3
    unit_price 5
    association :item, factory: :item
    association :invoice, factory: :invoice
  end
end
