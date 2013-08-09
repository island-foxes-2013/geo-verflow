require 'spec_helper'

describe Question do

  let(:question) { Question.new(title: "test", content: "test_content")}

  it { should belong_to(:user) }
  it { should have_many(:answers)}
  it { should have_many(:votes)}

  it "is an object of Question" do
    expect(question.class).to be Question
  end

  it "should save" do
    expect(question.save).to eq true
  end

  describe 'for votes' do
    before(:each) do
        question.save
    end

    context 'defaults' do
      it "should be empty" do
        expect(question.votes).to eq []
      end
    end

    context "upvotes and downvotes changing" do
      it '#increment_upvote increments by one' do
        # expect { question.upvote }.to change { question.votes }.from(0).to(1)
      end

      it '#increment_downvote increments by one' do
        # expect { question.downvote }.to change { question.votes }.from(0).to(-1)
      end
    end
  end

  context "new question object without title or content" do
    subject {Question.new}
    it "should not save" do
      expect(subject.save).to eq false
    end
  end

  it "to have a title and content" do
    expect(question.title).to eq "test"
    expect(question.content).to eq "test_content" 
  end


end
