class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_ids = current_user.timeline_user_ids
    @posts = Post.where(user_id: user_ids).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    if @post.is_a?(TextPost)
      @post_partial = 'text_posts/text_post'
    elsif @post.is_a?(ImagePost)
      @post_partial = 'image_posts/image_post'
    end
  end

  def new
  end

  def new_text_post
    @text_post = TextPost.new
  end

  def new_image_post
    @image_post = ImagePost.new
  end

  def create_text_post
    @text_post = current_user.text_posts.build(text_post_params)
    if @text_post.save
      redirect_to root_path, notice: 'Text post was successfully created.'
    else
      render 'new_text_post'
    end
  end

  def create_image_post
    @image_post = current_user.image_posts.build(image_post_params)
    if @image_post.save
      redirect_to root_path, notice: 'Image post was successfully created.'
    else
      render 'new_image_post'
    end
  end

  def all_posts
    @posts = Post.order("created_at DESC")
  end

  private

  def text_post_params
    params.require(:text_post).permit(:title, :body)
  end

  def image_post_params
    params.require(:image_post).permit(:title, :body, :url)
  end
end