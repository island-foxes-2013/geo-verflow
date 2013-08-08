require 'spec_helper'

describe Answer do
  # These two tests run on the model, not an instance of the model
  it { should belong_to(:question) }
  it { should have_many(:comments) }

  let(:answer) { build(:answer) }

  it "is an object of Answer" do
    expect(answer.class).to be Answer
  end

  it "should save" do
    expect(answer.save).to eq true
  end

  it "to have content" do
    expect(answer.content).to be
  end

  it { should respond_to(:votes) }

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

    describe "#votes" do
      subject { answer.votes }
      it { should eq answer.upvotes - answer.downvotes }
    end
  end

  context "new answer object without content" do
    subject { Answer.new }
    it "should not save" do
      expect(subject.save).to eq false
    end
  end

end
