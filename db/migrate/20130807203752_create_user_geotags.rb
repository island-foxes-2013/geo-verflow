class CreateUserGeotags < ActiveRecord::Migration
  def change
    create_table :user_geotags do |t|
      t.references :user
      t.references :geotag

      t.timestamps
    end
  end
end
