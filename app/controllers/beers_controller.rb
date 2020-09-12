# frozen_string_literal: true

# Beers that we are brewing
class BeersController < ApplicationController
  before_action :set_beers

  def index
    @beers = @beers.page(params[:page])
    @title = 'Beers at Rotator IPA'
  end

  def show
    @beer = Beer.friendly.find(params[:id])
    @beers = @beers.last(3)
    @title = @beer.name
  end

  private

  def set_beers
    @beers = Beer.all.order(start_date: :desc)
  end
end
