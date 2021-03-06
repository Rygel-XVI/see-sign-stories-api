class Channel < ApplicationRecord
  has_many :videos
  
  def self.update_channel    
    url = "https://www.googleapis.com/youtube/v3/search?key=#{ENV["TEST_API"]}&channelId=#{ENV["CHANNEL_ID"]}&part=snippet,id&type=video&maxResults=50"
    
    response = HTTP.get(url).parse
    
    parse_response(response['items'])
  end
  
  def self.parse_response(response)
    videos = []
    response.each do |video|

      embed_id = video.dig('id','videoId')
      tags = fetch_video_tags(embed_id)
      
      video_attributes = tags.merge({embed_id:embed_id})
      
      vid = Video.find_by(embed_id: embed_id)
      if vid
        vid.update(video_attributes)
        vid.touch
      else
        Video.create(video_attributes)
      end
      
    end
    
  end
  
  def self.fetch_video_tags(embed_id)
    url = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{embed_id}&key=#{ENV["TEST_API"]}"
    
    response = HTTP.get(url).parse['items'][0]['snippet']

    ar_lvl_low, ar_lvl_high = parse_ar_lvls(response["tags"])
    
    grade = response['tags']&.find{|tag| tag.match(/^Grade/)}
    
    chapter = response['tags'].find{|tag| tag.match(/^Chapter/)} ? response['tags'].find{|tag| tag.match(/^Chapter/)}.split(' ')[1] : nil
                          
    {
      ar_lvl_high: ar_lvl_high,
      ar_lvl_low: ar_lvl_low,
      grade: grade,
      title: response['title'],
      description: response['description'],
      is_chapter_book: !!response['tags'].find{|tag| tag.match(/^Chapter/)},
      chapter: chapter
    }
    
  end  
  
  
  def self.parse_ar_lvls(tags)
    ar_lvls = tags&.find{|tag| tag.match(/^AR/)}&.split(/\s|-/)
    if ar_lvls.is_a?(Array) && ar_lvls.size >= 3
      [ ar_lvls[1].to_f, ar_lvls[2].to_f ]
    else
      [ nil, nil ]
    end
  end

end


# look into async calls ruby rails em-http-request
