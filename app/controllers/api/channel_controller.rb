class Api::ChannelController < ApplicationController

  accepts_nested_attributes_for :video, reject_if: :all_blank

  def index
    @channels = Channel.all
    render json: @channels
  end

# manually adding a new channel via front-end
  def new
    @channel = Channel.new(channel_params)
    @channel.save
    redirect_to api_channel_index_path
  end

# update via api call to youtube to pull new video_ids and titles
  def update
    binding.pry
  end

# manually destroy a Channel and all associated videos
  def destroy

  end

  private

  def channel_params
    params.require(:channnel).permit(:channel_id, video_attributes: [:embed_id, :title])
  end

end
