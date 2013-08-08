require 'spec_helper'

describe "Answer voting" do
  let(:question) { create(:question) }
  let(:answer) {create(:answer, :question => question)}
  let(:votes) {answer.upvotes - answer.downvotes}
  before(:each) do
    5.times { answer.increment_upvote! }
  end

  context "from a question page" do
    before do
      visit question_answers_path(question)
    end

    subject{page}

    it {should have_link("vote up")}
    it {should have_link("vote down")}
    it {should have_content(answer.votes)}
    it {should have_content("Votes:")}

    context "after clicking vote up link", js:true  do
      before do
        click_link("vote up")
      end

      it{should have_no_link("vote up")}
      it{should have_content("")}

    end

    context "after clicking vote down link", js:true do
      before do
        click_link("vote down")
      end

      it{should have_no_link("vote down")}

    end


  end

end
