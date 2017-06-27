FactoryGirl.define do
  factory :transaction do
    credit_card_number "1"
    credit_card_expiration_date "1"
    result "success"
    association :invoice, factory: :invoice
    created_at "2014-03-27T14:54:02.000Z"
    updated_at "2014-03-27T14:54:02.000Z"
  end
end
