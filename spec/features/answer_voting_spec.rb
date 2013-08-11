require 'spec_helper'

def login(user)
  visit signin_path
  fill_in "user[username]", with: user.username
  fill_in "user[password]", with: user.password
  click_button "Sign In"
end

describe "Answer voting" do
  let(:question) { create(:question) }
  let(:answer) {create(:answer, :question => question)}
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login(user)
    answer.save
  end

  context "from a question page", js:true do
    before do
      visit question_answers_path(question)
    end

    subject{page}

    it {should have_link("vote up")}
    it {should have_link("vote down")}
    it {should have_content(answer.vote_count)}

    context "upvpote" do
      it "should update vote display" do
        expect do
          click_link("vote up")
          sleep 1
        end.to change{page.find('.answer_vote_number').text.to_i}.by(1)
      end
    end

    context "downvote" do
      it "should update vote display" do
        expect do
          click_link("vote down")
          sleep 1
        end.to change{page.find('.answer_vote_number').text.to_i}.by(-1)
      end
    end

  end

end
