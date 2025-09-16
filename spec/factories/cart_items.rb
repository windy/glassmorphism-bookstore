FactoryBot.define do
  factory :cart_item do
    cart { nil }
    book { nil }
    quantity { 1 }
  end
end
