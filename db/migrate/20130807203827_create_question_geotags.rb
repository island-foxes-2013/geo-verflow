class CreateQuestionGeotags < ActiveRecord::Migration
  def change
    create_table :question_geotags do |t|
      t.question :references
      t.geotag :references

      t.timestamps
    end
  end
end
