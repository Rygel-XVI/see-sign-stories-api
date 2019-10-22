class Api::VideoController < ApplicationController


# serves videos from db

  def index
    puts "HERE"
    @videos = Video.all
    binding.pry
    render json: @videos
  end

end
