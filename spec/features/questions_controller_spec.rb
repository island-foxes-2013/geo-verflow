require 'spec_helper'

describe QuestionsController do
  let!(:question){ Question.create(title: "test", content: "test-content") }
  
  before :each do
    visit questions_path
  end

  it "should load page properly" do
    expect(page).to have_content "All Questions:"
  end

  it "should list out questions" do
    # debugger
    # save_and_open_page
    expect(page).to have_content question.title
    expect(page).to have_content question.content
  end
end
