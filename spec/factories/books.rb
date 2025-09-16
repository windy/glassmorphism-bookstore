FactoryBot.define do
  factory :book do
    title { "MyString" }
    author { "MyString" }
    description { "MyText" }
    price { "9.99" }
    isbn { "MyString" }
    category { "MyString" }
    published_at { "2025-09-16" }
    stock_quantity { 1 }
  end
end
