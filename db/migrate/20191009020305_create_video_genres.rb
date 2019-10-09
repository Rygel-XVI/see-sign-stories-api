class CreateVideoGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :video_genres do |t|

      t.timestamps
    end
  end
end
