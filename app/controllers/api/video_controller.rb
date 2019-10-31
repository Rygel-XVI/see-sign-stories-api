class Api::VideoController < ApplicationController


# serves videos from db

  def index
    @videos = Video.all
    render json: @videos
  end

# manually adding a video from the front-end
  def new
    @video = Video.new(video_params)
    @video.save
    redirect_to api_video_index_path
  end

# manually update a single video from the front-end
  def update
    binding.pry
  end

  def destroy

  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :embed_id, :ar_lvl_high, :ar_lvl_low, :grade)
  end

end
