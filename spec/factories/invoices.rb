FactoryGirl.define do
  factory :invoice do
    status "shipped"
    association :customer, factory: :customer
    association :merchant, factory: :merchant
    created_at "2014-03-27T14:54:02.000Z"
    updated_at "2014-03-27T14:54:02.000Z"
  end
end
