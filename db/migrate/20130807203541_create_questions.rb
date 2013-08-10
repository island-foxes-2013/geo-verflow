class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.belongs_to :geotag
      t.string :title
      t.text :content
      t.integer :votes, default:0
      t.timestamps
    end
  end
end
