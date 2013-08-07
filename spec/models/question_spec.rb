require 'spec_helper'

describe Question do
  let(:question) { Question.new(title: "test", content: "test_content", upvotes: 0, downvotes: 0) }

  it "is an object of Question" do
    expect(question.class).to be Question
  end
end
