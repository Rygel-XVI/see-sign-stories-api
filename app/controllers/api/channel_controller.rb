class Api::ChannelController < ApplicationController

# if channels need update then update else redirect to serve videos
  def update

    redirect_to video_url
  end

end
