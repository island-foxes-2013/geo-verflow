require 'spec_helper'

describe Answer do
  let(:answer) { Answer.new( content: "test_content")}

  it { should belong_to(:question) }
  it { should have_many(:comments) }

  it "is an object of Answer" do
    expect(answer.class).to be Answer
  end

  it "should save" do
    expect(answer.save).to eq true
  end

  describe 'for votes' do
    before(:each) do
      answer.save
    end

    context "defaults" do
      it "upvotes and downvotes should be zero" do
        expect(answer.upvotes).to eq 0
        expect(answer.downvotes).to eq 0
      end
    end

    context "upvotes and downvotes changing" do
      it '#increment_upvote increments by one' do
        expect { answer.increment_upvote }.to change { answer.upvotes }.from(0).to(1)
      end

      it '#increment_downvote increments by one' do
        expect { answer.increment_downvote }.to change { answer.downvotes }.from(0).to(1)
      end
    end
  end

  context "new answer object without content" do
    subject { Answer.new }
    it "should not save" do
      expect(subject.save).to eq false
    end
  end

  it "to have content" do
    expect(answer.content).to eq "test_content" 
  end
end
