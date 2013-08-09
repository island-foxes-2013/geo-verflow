class QuestionGeotags < ActiveRecord::Base
  attr_accessible :question_id, :geotag_id

  belongs_to :question
  belongs_to :geotag
end
