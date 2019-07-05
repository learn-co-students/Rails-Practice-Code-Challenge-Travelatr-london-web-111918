class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
    @total_likes = @blogger.posts.map(&:likes).reduce(:+)
    @top_post = @blogger.posts.sort_by(&:likes).reverse.first
    @all_posts = @blogger.posts.sort_by(&:created_at).reverse
    @top_5_destinations = top_destinations
  end

  private

  def top_destinations
    destinations = @blogger.posts.map do |post|
      post.destination
    end
    counts = Hash.new
    destinations.each do |destination|
      counts[destination] = 0
    end
    destinations.each do |destination|
      counts[destination] += 1
    end
    counts.sort_by{|key, value| value }.reverse.to_h.keys
  end

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

end
