# frozen_string_literal: true

module Api
  # Handles any beer posts
  class BeersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :find_or_create_resources

    def create
      @carboy.beer_hourly_data_points.create!(
        beer: @beer,
        hydrometer: @hydrometer,
        temperature: params['Temp'],
        specific_gravity: params['SG']
      )
      render json: { created: true }
    end

    private

    def find_or_create_resources
      @beer = Beer.where(tilt_name: params['Beer']).first_or_create
      @hydrometer = Hydrometer.where(name: params['Color']).first_or_create
      @carboy = Carboy.where(beer: @beer, hydrometer: @hydrometer).first_or_create
    end
  end
end
