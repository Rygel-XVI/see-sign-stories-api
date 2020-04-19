class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string "embed_id"
      t.string "title"
      t.string "description"
      t.float "ar_lvl_high"
      t.float "ar_lvl_low"
      t.string "grade"
      t.boolean "is_chapter_book"
      t.integer "chapter"
      
      t.string "tags"

      t.timestamps
    end
  end
end
