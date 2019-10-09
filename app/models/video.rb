class Video < ApplicationRecord
  has_many :genres, through: :video_genre

end
