class CreateQuestionGeotags < ActiveRecord::Migration
  def change
    create_table :question_geotags do |t|
      t.references :question
      t.references :geotag

      t.timestamps
    end
  end
end
