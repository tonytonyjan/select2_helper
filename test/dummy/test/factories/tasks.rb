# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    project { Project.order('RANDOM()').first }
    description { Faker::Lorem.paragraph }
    status { Faker::Lorem.sentence }
  end
end
