FactoryGirl.define do
  factory :user do
    username "testuser"
    password "testpassword"
  end

  factory :question do
    user
    title "This is a title to a fake question"
    content "How much wood would a wood-chuck chuck if a wood-chuck could chuck wood??"
  end

  factory :answer do
    question
    user
    content "This is an awesome answer to a test question"
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
end
