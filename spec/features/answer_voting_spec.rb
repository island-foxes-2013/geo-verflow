require 'spec_helper'

describe "Answer voting" do
  let(:question) { create(:question) }
  let(:answer) {create(:answer, :question => question)}
  before(:each) do
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
        end.to change{page.find('.votes strong').text.to_i}.by(1)
      end
    end

    context "downvote" do
      it "should update vote display" do
        expect do
          click_link("vote down")
          sleep 1
        end.to change{page.find('.votes strong').text.to_i}.by(-1)
      end
    end

  end

end
