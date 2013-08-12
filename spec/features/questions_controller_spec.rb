require 'spec_helper'

def login(user)
  visit signin_path
  fill_in "user[username]", with: user.username
  fill_in "user[password]", with: user.password
  click_button "Sign In"
end 

describe QuestionsController do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:question){ user.questions.create(title: "test", content: "test-content") }
  # let(:user1) {User.create(username: "a", password: "a")}
  # let(:user2) {User.create(username: "b", password: "b")}

  before :each do
    visit questions_path
  end

  describe "questions page" do
    # let(:question2){ user2.questions.create(title: "some title", content: "some content")}

    it "should load page properly" do
      expect(page).to have_content "All Questions"
    end

    it "should list out questions" do
      visit questions_path # Need to refresh page so questions show up
      expect(page).to have_link("#{question.title}", href: question_answers_path(question))
    end
  end

  describe "a specific question" do
    before :each do
      login(user)
      visit question_answers_path(question)
    end

    it "should load properly" do
      page.should have_content(question.title)
      page.should have_link("upvote")
      page.should have_link("downvote")
    end
  # end
    context "upvote", js:true do
      it "should update vote display" do
        expect do 
          click_link("upvote")
          sleep 1
        end.to change{page.find('.question_vote_number').text.to_i}.by(1)
      end
    end
  # end

    context "downvote", js:true do
      it "should update vote display" do
        expect do
          click_link("downvote")
          sleep 1
        end.to change{page.find('.question_vote_number').text.to_i}.by(-1)
      end
    end
  #   end
  end

  describe "create a question" do
    before { visit new_question_path }

    it "should land on a page that asks you to create a question" do
      page.should have_content "Ask a question"
    end

    describe "with valid information" do
      let!(:question){ user1.questions.create(title: "test", content: "test-content") }
      let!(:question2){ user2.questions.create(title: "some title", content: "some content")}

      before do
        login(user2)
        visit new_question_path
        fill_in "question[title]",   with: question2.title
        fill_in "question[content]", with: question2.content
        click_button "Create"
      end

      it "should show up on the next page" do
        p page
        expect(page).to have_link("#{question2.title}", href: question_answers_path(question2))
      end
    end

    describe "with invalid information" do

      before do
        login(user2)
        visit new_question_path
        click_button "Create"
      end

      it "should render errors" do
        page.should have_content("Invalid Title/Content")
      end
    end

    describe "with non-logged-in user" do
      before { click_button "Create" }
      
      it "should render errors" do
        page.should have_content("Invalid")
      end
    end
  end
end
