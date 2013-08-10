require 'spec_helper'

def login(user)
  visit signin_path
  fill_in "user[username]", with: user.username
  fill_in "user[password]", with: user.password
  click_button "Sign In"
end 

describe QuestionsController do
  let(:user1) {User.create(username: "a", password: "a")}
  let(:user2) {User.create(username: "b", password: "b")}

  before  do
    visit questions_path
  end

  describe "questions page" do
    let(:question){ user1.questions.create(title: "test", content: "test-content") }
    let(:question2){ user2.questions.create(title: "some title", content: "some content")}

    it "should load page properly" do
      page.should have_content "All Questions"
    end

    it "should list out questions" do
      # While q1 & q2 are initialized above, you have to "bring" them into the function here...
      question
      question2
      visit questions_path # Need to refresh page so questions show up
      expect(page).to have_link("#{question.title}", href: question_answers_path(question))
    end

    describe "on a question", js:true do
      before do
        visit question_answers_path(question)
      end

      subject{page}

      it {should have_link("upvote")}
      it {should have_link("downvote")}

      context "upvote" do
        it "should update vote display" do
          expect do 
            click_link("upvote")
            sleep 1
          end.to change{page.find('.q_votes strong').text.to_i}.by(1)
        end
      end

      context "downvote" do
        it "should update vote display" do
          expect do
            click_link("downvote")
            sleep 1
          end.to change{page.find('.q_votes strong').text.to_i}.by(-1)
        end
      end
    end
  end

  describe "create a question" do
    before { visit new_question_path }

    it "should land on a page that asks you to create a question" do
      page.should have_content "New Question"
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
