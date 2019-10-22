class Channel < ApplicationRecord
  has_many :videos



  def self.update_or_create
    channel_ids = Channel.get_and_format_channel_ids

    channels = channel_ids.map do |cid|

      channel = Channel.find_by(channel_id: cid)

      # if channel DNE then create and call update on it else call update_if_needed to find out if it needs updating.
      if (channel == nil)

        c = Channel.new(channel_id: cid)
        c.update_channel if (c.save)

      # else
      #   c.update_if_needed
      end

    end
    #
    # channels.each do |channel|
    #   channel.update_if_needed
    # end

  end

  # if there are more channel ids in the future we will parse them here
  def self.get_and_format_channel_ids
    [ENV['CHANNEL_ID']]
  end



# currently updates once every 24hrs
  def update_needed?
    Time.now.utc - self.updated_at > 61200 ? true : false
      # do request to update this channel and videos
      # self.update_channel
    # end
  end


  def update_channel
    cid = self.channel_id
    channel = HTTP.get("https://www.googleapis.com/youtube/v3/search?key=#{ENV["TEST_API"]}&channelId=#{cid}&part=snippet,id&type=video&maxResults=50").parse

    videos = channel["items"]

    video_ids = videos.map do |video|
      video["id"]["videoId"]
    end

    Video.update_by_id(video_ids)
  end


end


# HTTP.get("https://github.com").body
# look into async calls ruby rails em-http-request
