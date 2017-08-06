class PostsController < ApplicationController
  def index
    @posts = Post.includes(:tags).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
    else
      render 'new'
    end

  end

  def show
    @post = Post.find_by_id(params[:id])

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
