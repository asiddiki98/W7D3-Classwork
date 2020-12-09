FactoryBot.define do
  factory :user do
    username { Faker::JapaneseMedia::DragonBall.character}
    password { "dragonball" }
  end
end
