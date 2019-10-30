class Api::VideoController < ApplicationController


# serves videos from db

  def index
    @videos = Video.all
    render json: @videos
  end

  def new
    @video = Video.new(video_params)
    @video.save
    redirect_to api_video_index_path
  end

  def update
    binding.pry
  end

  def destroy

  end

  # def update
  #   Video.update_all
  # end

  private

  def video_params
    params.require(:video).permit(:title, :description, :embed_id, :ar_lvl_high, :ar_lvl_low, :grade)
  end

end
