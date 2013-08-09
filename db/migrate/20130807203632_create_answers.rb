class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user
      t.text :content
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
