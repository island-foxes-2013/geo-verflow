class CreateQuestionTopics < ActiveRecord::Migration
  def change
    create_table :question_topics do |t|
      t.question :references
      t.topic :references

      t.timestamps
    end
  end
end
