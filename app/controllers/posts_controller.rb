# frozen_string_literal: true

# All the blog posts
class PostsController < ApplicationController
  before_action :set_posts

  def index
    @posts = @posts.page(params[:page])
    @title = 'Rotator IPA Blog'
  end

  def show
    @post = @posts.friendly.find(params[:id])
    @title = @post.title
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
