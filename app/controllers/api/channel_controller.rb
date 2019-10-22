class Api::ChannelController < ApplicationController

# if channels need update then update else redirect to serve videos

# change to accessing the ENV from here
# find_or_create on each cid
# update_if_needed on each cid
#   update_if_needed will also pull a string of vid
#     call find_or_create on each vid  || update each vid
            # update each vid can add update if needed on vid in future if needed

  def index
    Channel.update_or_create
    @channels = Channel.all

    @channels.each do |channel|
      if (channel.update_needed?)
        channel.update_channel
      end
    end
    redirect_to api_video_index_path
  end


end
