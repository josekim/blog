class PostsController < ApplicationController
  def index
    @posts = Post.includes(:tags).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post].permit(:title,:body).to_h)
    ApplicationHelper.generate_tags_and_taggings(@post, params[:tags][:tags])
    if @post.save
      redirect_to @post
    else
      redirect_to new_post_path
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
