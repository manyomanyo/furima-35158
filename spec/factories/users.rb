FactoryBot.define do
  factory :user do
      transient do
        person {Gimei.name}
      end
      nickname {Faker::Name.name}
      email {Faker::Internet.free_email}
      password = Faker::Lorem.characters(number:6, min_alpha:1, min_numeric:1)
      password {password}
      password_confirmation {password}
      encrypted_password {password}
      user_name_family {person.last.kanji}
      user_name_first {person.first.kanji}
      user_name_kana_family {person.last.katakana}
      user_name_kana_first {person.first.katakana}
      birthday {Faker::Date.backward}
  end
end