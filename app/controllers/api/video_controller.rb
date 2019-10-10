class VideoController < ApplicationController


# serves videos from db

  def index
    videos = Video.all
  end

end
