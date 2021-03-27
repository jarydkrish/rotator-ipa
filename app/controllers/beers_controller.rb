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
    @beers = @beers.where.not(id: @beer.id).order(start_date: :desc).first(3)
    @title = @beer.name
  end

  def show_description
    @hide_header = true
    @beer = Beer.friendly.find(params[:id])
  end

  private

  def set_beers
    @beers = Beer.all.order(start_date: :desc)
  end
end
