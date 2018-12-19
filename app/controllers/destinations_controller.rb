class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
    @bloggers = Blogger.all
    @posts = Post.all
  end

end
