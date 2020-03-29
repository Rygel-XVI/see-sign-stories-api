class ChannelController < ApplicationController

# if channels need update then update else redirect to serve videos

# change to accessing the ENV from here
# find_or_create on each cid
# update_if_needed on each cid
#   update_if_needed will also pull a string of vid
#     call find_or_create on each vid  || update each vid
            # update each vid can add update if needed on vid in future if needed


# currently only implementing with one channel.
# future plans:
#   depending on what is called will check the appropriate channel only
#   will update via api call based on when channel was last updated
#   add flags to exclude api call update
  def index
    Channel.update_channel if Video.all.size == 0 || Video.first.updated_at.to_datetime < DateTime.now - 1
    @videos = Video.all

    render json: @videos
  end

# checks for new channels
# creates an array of channels needing update
# updates each channel via params
# redirects to serve via a different route
  def update
    Channel.channels_to_update
  end

end
