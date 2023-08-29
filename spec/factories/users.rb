FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    #email                 {Faker::Internet.email}
    email                 {'faker@test'}
    #password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password              {'a123456'}
    password_confirmation {password}
  end
end
