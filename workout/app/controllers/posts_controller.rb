class PostsController < ApplicationController
  before_action :authenticate_required

  def index
      @posts = Post.all
  end

  def new
     @post = Post.new
  end

  def create
    @post = Post.create(post_params)
   if @post.save
    redirect_to user_posts_path
  end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :reps, :time, :user_id, :post_id)
  end
end
