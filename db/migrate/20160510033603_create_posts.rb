class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title,		null: false
      t.text :content
      t.belongs_to :trip, index: true
      t.string :image

      t.timestamps null: false
    end
  end
end
