class Channel < ApplicationRecord
  has_many :videos

  def self.update_if_needed

    # in the future if there is more than one channel will make it a string and convert it into an array of id's to manipulate
    # binding.pry
    channels = [ENV['CHANNEL_ID']]

    channels.each do |channel|

      # find or create the channel
      c = Channel.find_or_create_by(channel_id: channel)

      # if it has not been updated in 24 hrs or is newly created
      if ((c.created_at === c.updated_at) || (Time.now.utc - c.updated_at > 61200))

        # do request to update this channel and videos
        c.update_videos
      end
    end

  end

  def update_videos
    cid = self.channel_id
    channel = HTTP.get("https://www.googleapis.com/youtube/v3/search?key=#{ENV["TEST_API"]}&channelId=#{cid}&part=snippet,id&type=video&maxResults=50")

    binding.pry

    # channel.parse gives json
  end


end


# HTTP.get("https://github.com").body
# look into async calls ruby rails em-http-request
