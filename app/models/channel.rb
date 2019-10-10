class Channel < ApplicationRecord
  has_many :videos

  def self.update_if_needed
    channels = Channel.all

    channels.each do |channel|
      if (Time.now.utc - channel.updated_at > 61200)
        # do request to update this channel and videos
      end
    end

  end

end
