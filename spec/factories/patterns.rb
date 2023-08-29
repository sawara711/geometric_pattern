FactoryBot.define do
  factory :pattern do
    title     {Faker::Lorem.sentence(word_count: 1)}
    #association :user
    user_id   {'1'}

    after(:build) do |pattern|
      pattern.image.attach(io: File.open('public/images/test_icon.png'), filename: 'DSC_2419.jpg')
    end
  end
end
