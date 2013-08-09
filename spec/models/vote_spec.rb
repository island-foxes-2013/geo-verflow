require 'spec_helper'

describe Vote do
  it { should belong_to(:user) }
  it { should belong_to(:votable) }


  let(:question_vote) { build(:question_vote) }
  let(:answer_vote) { build(:answer_vote) }
  context "#new" do
    it 'will have the Question votable_type if the vote is on a question' do
      question_vote.votable_type.should eq 'Question'
    end

    it 'will have the Answer votable_type if the vote is on an answer' do
      answer_vote.votable_type.should eq 'Answer'
    end

  end
  
end
