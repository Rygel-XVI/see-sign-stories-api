class Video < ApplicationRecord
  has_many :genres, through: :video_genre


  def self.update_by_id(video_ids)

    video_ids_string = video_ids.join(",")

    videos = HTTP.get("https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{video_ids_string}&key=#{ENV["TEST_API"]}").parse

    video_objects = videos["items"].map do |video|
      video_object = Video.find_by(embed_id: video["id"])
      video_object = Video.create(embed_id: video["id"]) if (video_object == nil)
      video_object.update_video(video)
    end

    # video_objects.each do |update_videos(videos)
    end

    def update_video(json)
      ar_level = get_ar_levels(json["snippet"]["tags"])
      grade = get_grade(json["snippet"]["tags"])
      # genres = get_genres(json["snippet"]["tags"])

      self.update(title: json["snippet"]["title"] ,
        description: json["snippet"]["description"],
        ar_lvl_high: ar_level[0],
        ar_lvl_low: ar_level[1],
        grade: grade,
      )
    end

    def get_ar_levels(tags)
      tag = tags.select{|t| t.match?(/^AR/)}[0]
      tag = tag.split(/\s|\-/)
      [tag[1],tag[2]]
    end

    def get_grade(tags)
      tags.select{|t| t.match?(/^Grade/)}[0]
    end


  end
