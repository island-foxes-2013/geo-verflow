require 'spec_helper'

describe QuestionGeotags do
  it { should belong_to :question }
  it { should belong_to :geotag }

  let(:question) { create(:question) }
  let(:geotag) { create(:geotag) }
  let(:qgeotag) { QuestionGeotags.new }

  context "should not create invalid questiongeotags" do
    it 'should fail on invalid creation' do
      pending
      expect(qgeotag.save).to be false
    end
  end

  context "should create valid question geotags" do

    it 'should create a valid question geotag' do
      pending
      let!(qgeotag.question_id) { question.id }
      let!(qgeotag.geotag_id) { geotag.id }

      expect(qgeotag.save).to be true
    end
  end
end
