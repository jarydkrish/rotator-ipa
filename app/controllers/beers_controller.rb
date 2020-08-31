# frozen_string_literal: true

# Beers that we are brewing
class BeersController < ApplicationController
  before_action :set_posts

  def index
    @beers = @beers.page(params[:page])
    @title = 'Beers at Rotator IPA'
  end

  def show
    @beer = @beers.find(params[:id])
    @title = @beer.name
  end

  private

  def set_posts
    @beers = Beer.all.order(start_date: :desc)
  end
end
