# frozen_string_literal: true

module Api
  # Handles any beer hourly data points
  class HourlyDataPointsController < ApiController
    before_action :set_beer_hourly_data_points, only: [:index]
    before_action :find_or_create_resources, only: [:create]

    def index
      paginate json: @hourly_data_points.order(created_at: :asc)
    end

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

    # rubocop:disable Style/GuardClause
    def set_beer_hourly_data_points
      @hourly_data_points = BeerHourlyDataPoint.all
      if params[:beer_id]
        beer = Beer.friendly.find(params[:beer_id])
        @hourly_data_points = @hourly_data_points.where(beer:)
      end
      if params[:carboy_id]
        carboy = Carboy.find(params[:carboy_id])
        @hourly_data_points = @hourly_data_points.where(carboy:)
      end
    end
    # rubocop:enable Style/GuardClause
  end
end
