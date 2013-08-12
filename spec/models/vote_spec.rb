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

    it "will not be saved if a user has voted on it previously" do
      question_vote.save
      expect {
        user = User.find(question_vote.user_id)
        user.votes.create!(votable_id: question_vote.votable_id, votable_type: question_vote.votable_type)
      }.to raise_error
      # expect(Vote.new(
      #   user_id: question_vote.user_id,
      #   votable_id: question_vote.votable_id,
      #   votable_type: question_vote.votable_type).save).to eq false
    end
  end
  
end
