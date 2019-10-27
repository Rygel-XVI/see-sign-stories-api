class Api::ChannelController < ApplicationController

# if channels need update then update else redirect to serve videos

# change to accessing the ENV from here
# find_or_create on each cid
# update_if_needed on each cid
#   update_if_needed will also pull a string of vid
#     call find_or_create on each vid  || update each vid
            # update each vid can add update if needed on vid in future if needed

  def index
    # Channel.update_or_create
    @channels = Channel.all
    # binding.pry
    render json: @channels
  end

# checks for new channels
# creates an array of channels needing update
# updates each channel via params
# redirects to serve via a different route
  def update
    Channel.channels_to_update
  end


# whitelist params and nested params for videos


end
