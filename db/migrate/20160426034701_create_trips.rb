class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
        t.float :latitude
        t.float :longitude
    	t.string :location, null: false
    	t.string :title, null: false
    	t.date :start_date
    	t.date :end_date
        t.attachment :cover_image
    	t.references :user, null: false
    	t.timestamps null: false
    	t.index :user_id
    end

  end
end
