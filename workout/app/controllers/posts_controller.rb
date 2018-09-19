class PostsController < ApplicationController
  def index
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
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @posts = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:name, :reps, :time)
  end
end
