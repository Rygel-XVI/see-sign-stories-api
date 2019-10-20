class Api::ChannelController < ApplicationController

# if channels need update then update else redirect to serve videos

# change to accessing the ENV from here
# calling a function to parse the string
# find_or_create on each cid
# update_if_needed on each cid
#   update_if_needed will also pull a string of vid
#     call find_or_create on each vid  || update each vid
            # update each vid can add update if needed on vid in future if needed

  def update
    Channel.update_if_needed
    redirect_to video_url
  end

end
