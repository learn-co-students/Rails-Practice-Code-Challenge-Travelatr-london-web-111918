class DestinationsController < ApplicationController

def index
  @destinations = Destination.all
end

def show
  @destination = Destination.find(params[:id])
  @top_5_posts = @destination.posts.sort_by(&:updated_at).reverse.slice(0,5)
  @top_post = @destination.posts.sort_by(&:likes).reverse.first
  @ages = @destination.bloggers.map(&:age)
  if @ages != []
    @average_age = (@ages.reduce(:+).to_f / @ages.length.to_f).floor
  else
    @average_age = 0
  end
end

end
