require 'faker'

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Name.name }
  end

  factory :question do
    user
    title { Faker::Company.bs }
    content { Faker::Lorem.paragraph }
  end

  factory :answer do
    question
    user
    content { Faker::Company.bs }
  end

  factory :question_comment, class: Comment do
    content "This is an awesome test comment!"
    user
    commentable_type "Question"
  end

  factory :answer_comment, class: Comment do
    content "This is an awesome test comment!"
    user
    commentable_type "Answer"
  end

  factory :question_vote, class: Vote do
    votable_type "Question"
    value 0
    user
  end

  factory :answer_vote, class: Vote do
    votable_type "Answer"
    value 0
    user
  end
end
