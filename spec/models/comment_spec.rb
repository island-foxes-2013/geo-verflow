require 'spec_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:commentable) }

  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question) }
  let(:answer) { FactoryGirl.create(:answer) }
  let(:answer_comment) { FactoryGirl.create(:answer_comment) }
  let(:question_comment) { FactoryGirl.create(:question_comment) }

  context '#new' do
    it 'will not save without :content attribute' do
      expect { Comment.create! }.to raise_error
    end

    it 'will not save to the database without an explicit commentable_type' do
      expect { Comment.create!(content: "Hey guys, it's the REAL Jesse.") }.to raise_error
    end

    it 'will have the Question commentable_type if the comment is in response to a question' do
      question_comment.commentable_type.should eq 'Question'
    end

    it 'will have the Answer commentable_type if comment is in response to an answer' do
      answer_comment.commentable_type.should eq 'Answer'
    end
    
  end

end
