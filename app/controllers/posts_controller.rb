class PostsController < ApplicationController
  before_action :set_posts

  def index
    @posts = @posts.page(params[:page])
  end

  def show
    @post = @posts.find(params[:id])
  end

  private

  def set_posts
    if current_user
      @posts = Post.all.order(published_at: :desc)
    else
      @posts = Post.where(published: true).order(published_at: :desc)
    end
  end
end
