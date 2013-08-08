require 'spec_helper'

describe "Answer voting", js:false do
  let(:question) { create(:question) }
  let(:answer) {create(:answer)}
  before(:each) do
    question.answers << answer
  end

  context "from a question page" do
    before do
      visit question_answers_path(question)
    end

    subject{page}

    it {should have_link("vote up")}
    it {should have_link("vote down")}

    context "after clicking vote up link" do
      before do
        click_link("vote up")
      end

      it{should have_no_link("vote up")}

      it "should increment the upvote count by 1" do
        expect { answer.increment_upvote }.to change { answer.upvotes }.by(1)
      end
    end

    context "after clicking vote down link" do
      before do
        click_link("vote down")
      end

      it{should have_no_link("vote down")}

      it "should increment the downvote count by 1" do
        expect { answer.increment_downvote }.to change { answer.downvotes }.by(1)
      end
    end


  end

end
