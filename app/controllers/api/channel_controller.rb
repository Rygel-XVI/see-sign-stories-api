class Api::ChannelController < ApplicationController

  accepts_nested_attributes_for :video, reject_if: :all_blank

# if channels need update then update else redirect to serve videos

# change to accessing the ENV from here
# find_or_create on each cid
# update_if_needed on each cid
#   update_if_needed will also pull a string of vid
#     call find_or_create on each vid  || update each vid
            # update each vid can add update if needed on vid in future if needed
#
#   def index
#     # Channel.update_or_create
#     @channels = Channel.all
#     # binding.pry
#     render json: @channels
#   end
#
# # checks for new channels
# # creates an array of channels needing update
# # updates each channel via params
# # redirects to serve via a different route
#   def update
#     Channel.channels_to_update
#   end

  def index
    @channels = Channel.all
    render json: @channels
  end

  def new
    @channel = Channel.new(channel_params)
    @channel.save
    redirect_to api_channel_index_path
  end

  def update
    binding.pry

  end

  def destroy

  end

# whitelist params and nested params for videos
  private

  def channel_params
    params.require(:channnel).permit(:channel_id, video_attributes: [:embed_id, :title])
  end

end
