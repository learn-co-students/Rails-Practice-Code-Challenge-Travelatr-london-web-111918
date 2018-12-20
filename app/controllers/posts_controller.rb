class PostsController < ApplicationController
  before_action :find_post, only: [:show, :like_post, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(likes: 0))
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def like_post
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

end
