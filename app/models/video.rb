class Video < ApplicationRecord
  has_many :genres, through: :video_genre


  def self.update_by_id(video_ids)

    video_ids_string = video_ids.join(",")

    videos = HTTP.get("https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{video_ids_string}&key=#{ENV["TEST_API"]}").parse

    videos["items"].each do |video|
        v = Video.find_by(embed_id: video["id"])
        if (v == nil)
          v = Video.create(embed_id: video["id"])
        end
        v.update(video)
    end

  end

end
