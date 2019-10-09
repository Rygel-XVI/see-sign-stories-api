class Genre < ApplicationRecord
  has_many :videos, through: :video_genre

end
