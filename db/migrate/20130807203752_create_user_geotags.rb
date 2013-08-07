class CreateUserGeotags < ActiveRecord::Migration
  def change
    create_table :user_geotags do |t|
      t.user :references
      t.geotag :references

      t.timestamps
    end
  end
end
