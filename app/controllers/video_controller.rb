class VideoController < ApplicationController


# serves videos from db

  def index
    @videos = Video.all
    render json: @videos
  end

  # def update
  #   Video.update_all
  # end

end
