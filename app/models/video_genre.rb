class VideoGenre < ApplicationRecord
  belongs_to :video, :genre
end
