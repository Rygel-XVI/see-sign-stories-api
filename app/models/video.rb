class Video < ApplicationRecord
  has_many :genres, through: :video_genre


  def self.update_by_id(video_ids)

    video_ids_string = video_ids.join(",")

    videos = HTTP.get("https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{video_ids_string}&key=#{ENV["TEST_API"]}").parse
    binding.pry

    videos["items"]
    # produces array of nil or video objects
    # videos = video_ids.map do |id|
    #   Video.find_by(embed_id: id)
    # end
    #
    # videos.each do |video|
    #   if (video == nil)
    #
    #   end
    # end

  end

end
