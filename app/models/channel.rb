class Channel < ApplicationRecord
  has_many :videos



  # def self.update_or_create
  #   channel_ids = Channel.get_and_format_channel_ids
  #
  #   channels = channel_ids.map do |cid|
  #
  #     channel = Channel.find_by(channel_id: cid)
  #
  #     # if channel DNE then create and call update on it else call update_if_needed to find out if it needs updating.
  #     if (channel == nil)
  #
  #       c = Channel.new(channel_id: cid)
  #       c.update_channel if (c.save)
  #
  #     end
  #
  #   end
  #
  # end
  
  def self.update_channel
    videos = HTTP.get(`https://www.googleapis.com/youtube/v3/search?key=#{TEST_API}&channelId=#{CHANNEL_ID}&part=snippet,id&type=video&maxResults=50`).parse
    
    ## setup postgres on computer
    binding.pry
  end


  def self.channels_to_update
    Channel.check_for_new_channels
    Channel.all.each do |channel|
      channel.update_channel if channel.update_needed?
    end
    # Channel.all.filter{|c| c.update_neefded? }
  end

# returns array of channels
  def self.check_for_new_channels
    channel_ids = Channel.get_and_format_channel_ids
    channel_ids.map do |cid|
      channel = Channel.find_by(channel_id: cid)

      if (channel == nil)
        c = Channel.create(channel_id: cid)
      end

    end
  end

  # if there are more channel ids in the future we will parse them here
  def self.get_and_format_channel_ids
    [ENV['CHANNEL_ID']]
  end

# currently updates once every 24hrs or after creation
  def update_needed?
    self.updated_at == self.created_at || Time.now.utc - self.updated_at > 61200
  end



# this should do
#   => api request to pull the video ids from the channel
#   => api request to pull the video information from the video ids
  # => return the info to the controller to update utilizing params

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


# look into async calls ruby rails em-http-request
