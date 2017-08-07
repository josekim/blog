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
    @post = Post.find_by_id(params[:id])
    @tags = @post.tags.map(&:name).join(", ")
  end

  def update
    p "I WENT HEREHRHERHEHRHERHEHRHERHHERHEHRHERHEHR"
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(params[:post].permit(:title,:body).to_h)
    ApplicationHelper.update_tags_and_taggings(@post, params[:tags][:to_s])
    if @post.save
      redirect_to @post
    else
      redirect_to new_post_path
    end
  end

  def destroy
    p params
    Post.find_by_id(params[:id]).delete
    redirect_to '/'
  end
end
