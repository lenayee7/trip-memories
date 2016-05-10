class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title,			null: false, default: ""
      t.text :content
      t.references :trip, index: true, foreign_key: true
      t.string :photo

      t.timestamps null: false
    end
  end
end
