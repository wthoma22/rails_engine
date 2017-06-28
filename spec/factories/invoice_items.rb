FactoryGirl.define do
  factory :invoice_item do
    quantity 3
    unit_price 5
    association :item, factory: :item
    association :invoice, factory: :invoice
    created_at "2014-03-27T14:54:02.000Z"
    updated_at "2014-03-27T14:54:02.000Z"
  end
end
