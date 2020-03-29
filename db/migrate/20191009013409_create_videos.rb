class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :embed_id
      t.float :ar_lvl_high
      t.float :ar_lvl_low
      t.string :grade

      t.timestamps
    end
  end
end
