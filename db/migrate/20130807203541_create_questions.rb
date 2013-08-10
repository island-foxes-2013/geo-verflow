class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user
      t.string :title
      t.text :content
      t.integer :vote_count, default:0
      t.timestamps
    end
  end
end
