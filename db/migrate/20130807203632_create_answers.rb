class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.question :references
      t.user :references
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
