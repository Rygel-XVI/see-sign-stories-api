class Video < ApplicationRecord
  has_many :genres, through: :video_genre


  def self.update_by_id(video_ids)
    binding.pry
  end

end
