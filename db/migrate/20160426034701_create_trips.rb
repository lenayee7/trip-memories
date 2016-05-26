class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.string :location, null: false
    	t.string :title, null: false
    	t.date :start_date
    	t.date :end_date
        t.string :cover_image
    	t.references :user, null: false
    	t.timestamps null: false
    	t.index :user_id
    end

  end
end
