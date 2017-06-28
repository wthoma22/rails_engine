FactoryGirl.define do
  factory :item do
    name "Item"
    description "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro."
    unit_price 75107
    association :merchant, factory: :merchant
    created_at "2014-03-27T14:54:02.000Z"
    updated_at "2014-03-27T14:54:02.000Z"
  end
end
