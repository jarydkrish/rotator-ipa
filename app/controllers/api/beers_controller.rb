# frozen_string_literal: true

module Api
  # Handles any beer posts
  class BeersController < ApiController
    before_action :set_beers

    def index
      @beers = Beer.all
      paginate json: @beers
    end

    def show
      beer = @beers.find(params[:id])
      render json: beer
    end

    private

    def set_beers
      @beer = Beer.all
    end
  end
end
