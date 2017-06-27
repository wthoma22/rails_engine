FactoryGirl.define do
  factory :transaction do
    credit_card_number "1"
    credit_card_expiration_date "1"
    result "success"
    association :invoice, factory: :invoice
    created_at "Thu, 27 Mar 2014 14:54:02 UTC +00:00"
    updated_at "Fri, 27 Mar 2014 14:54:02 UTC +00:00"
  end
end
