class PostsController < ApplicationController
  before_action :authenticate_required

  def index
      @post = Post.new
      @posts = Post.all
      
  end

  def new
     @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to posts_path(@post)
    else
     # @posts = Post.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :reps, :time, :user_id)
  end
end
