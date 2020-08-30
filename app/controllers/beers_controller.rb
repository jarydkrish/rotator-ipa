# frozen_string_literal: true

# Beers that we are brewing
class BeersController < ApplicationController
  before_action :set_posts

  def index
    @beers = @beers.page(params[:page])
  end

  def show
    @beer = @beers.find(params[:id])
  end

  private

  def set_posts
    @beers = Beer.all.order(start_date: :desc)
  end
end
