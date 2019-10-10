class Api::ChannelController < ApplicationController

# if channels need update then update else redirect to serve videos
  def update
    Channel.update_if_needed
    redirect_to video_url
  end

end
