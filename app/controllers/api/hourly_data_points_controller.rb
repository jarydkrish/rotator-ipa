# frozen_string_literal: true

module Api
  # Handles any beer hourly data points
  class HourlyDataPointsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      data_points = BeerHourlyDataPoint.all
      if params[:beer_id]
        beer = Beer.friendly.find(params[:beer_id])
        data_points = data_points.where(beer: beer)
      end
      render json: data_points.to_json
    end

    def create
      beer = Beer.where(tilt_name: params['Beer']).first_or_create
      hydrometer = Hydrometer.where(name: params['Color']).first_or_create
      beer.beer_hourly_data_points.create!(
        temperature: params['Temp'],
        specific_gravity: params['SG'],
        hydrometer: hydrometer
      )
      render json: { created: true }
    end
  end
end
