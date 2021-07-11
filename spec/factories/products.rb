FactoryBot.define do
  factory :product do
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name              {Faker::Commerce.product_name[1..40]}
    description       {Faker::Lorem.sentence[1..1000]}
    price             {Faker::Number.between(from: 300, to: 9999999)}
    item_state_id     {Faker::Number.between(from: 2, to: 7)}
    category_id       {Faker::Number.between(from: 2, to: 11)}
    delivery_fee_id   {Faker::Number.between(from: 2, to: 3)}
    delivery_day_id   {Faker::Number.between(from: 2, to: 4)}
    user_area_id      {Faker::Number.between(from: 2, to: 48)}
  end
end
