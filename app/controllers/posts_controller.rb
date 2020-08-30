# frozen_string_literal: true

# All the blog posts
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
    @posts = if current_user
               Post.all.order(published_at: :desc)
             else
               Post.where(published: true).order(published_at: :desc)
             end
  end
end
