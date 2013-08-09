class CreateGeotags < ActiveRecord::Migration
  def change
    create_table :geotags do |t|
      t.string :city_name 
      # t.integer :tag_count

      t.timestamps
    end
  end
end
