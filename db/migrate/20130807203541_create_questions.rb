class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.user :references
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
