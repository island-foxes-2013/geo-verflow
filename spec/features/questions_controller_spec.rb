require 'spec_helper'

describe QuestionsController do
  let!(:question){ User.create(username: "a", password: "a").questions.create(title: "test", content: "test-content") }
  let!(:question2){ User.create(username: "b", password: "b").questions.create(title: "some title", content: "some content")}

  before :each do
    visit questions_path
  end

  describe "questions page" do
    it "should load page properly" do
      page.should have_content "All Questions"
    end

    it "should list out questions" do
      expect(page).to have_link("#{question.title}", href: question_answers_path(question))
    end
  end

  describe "create a question" do
    before { visit new_question_path }

    it "should land on a page that asks you to create a question" do
      page.should have_content "New Question"
    end

    describe "with valid information" do
      before do
        
        fill_in "question[title]",   with: question2.title
        fill_in "question[content]", with: question2.content
        click_button "Create"
      end

      it "should show up on the next page" do
        expect(page).to have_link("#{question2.title}", href: question_answers_path(question2))
      end
    end

    describe "with invalid information" do
      before { click_button "Create" }
      
      it "should render errors" do
        page.should have_content("Invalid")
      end
    end
  end
end
