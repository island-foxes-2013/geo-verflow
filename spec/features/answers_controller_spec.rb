require 'spec_helper'

describe AnswersController do
  let!(:question) { Question.create(title: "rspec", content: "what is rspec?")}
  let!(:answer) { question.answers.create(content: "Testing for Rails")}

  before :each do
    visit question_answers_path(question)
  end

  context "a question page with answers" do
    it "should load properly" do
      expect(page).to have_content "Question:"
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
