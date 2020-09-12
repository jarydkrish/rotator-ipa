# frozen_string_literal: true

# Static pages for the app
class PagesController < ApplicationController
  def home
    @beers = Beer.order(start_date: :desc).first(3)
    @posts = Post.where(published: true).order(published_at: :desc).first(3)
  end

  def sitemap
    @beers = Beer.order(start_date: :desc)
    @posts = Post.where(published: true).order(published_at: :desc)
  end
end
