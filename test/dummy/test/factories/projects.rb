# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name { Faker::Name.title }
    content { Faker::Lorem.paragraph }
  end
end
