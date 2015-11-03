FactoryGirl.define do
  factory :share do
    url Faker::Internet.url
    title Faker::Hacker.say_something_smart
    description Faker::Lorem.sentence
    category Faker::Hacker.noun
  end
end
