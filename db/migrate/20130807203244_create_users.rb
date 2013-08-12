class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.belongs_to :geotag

      t.timestamps
    end
  end
end
