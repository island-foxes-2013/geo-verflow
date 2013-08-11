require 'spec_helper'

def login(user)
  visit signin_path
  fill_in "user[username]", with: user.username
  fill_in "user[password]", with: user.password
  click_button "Sign In"
end

describe AnswersController do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { user.questions.create(title: "rspec", content: "what is rspec?")}
  let!(:answer) { question.answers.create(content: "Testing for Rails")}

  before do
    login user
    user.answers << answer
    user.save
    visit question_answers_path(question)
  end
context "new answer" do
  it "should be created" do
    expect do
      fill_in 'answer[content]', with: "TEST ANSWER"
      click_button "Submit Answer"
    end.to change{Answer.count}.by(1)
  end
end

context "a question page with answers" do
  it "should load properly" do
    expect(page).to have_content('Submit an answer:')
    expect(page).to have_content "Responses:"
  end

  it "should display question" do
    expect(page).to have_content question.title
    expect(page).to have_content question.content
  end

  it "should list out answers" do
    expect(page).to have_content answer.content
  end
end
end
