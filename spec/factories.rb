require 'faker'

FactoryGirl.define do
  factory :user do
    username "test"
    password "test"
  end

  factory :question do
    title { Faker::Company.bs }
    content { Faker::Lorem.paragraph }
  end

  factory :answer do
    content { Faker::Company.bs }
  end
end
