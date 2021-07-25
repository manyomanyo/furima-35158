FactoryBot.define do
  factory :purchase_address do
    postal_number {'123-4567'}
    user_area_id {2}
    city {'さいたま市'}
    block {'1-1-1'}
    building {'坂口マンション'}
    phone_number {'05012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
