# frozen_string_literal: true

module Api
  # Handles any beer posts
  class BeersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      beer = Beer.where(name: params['Beer']).first_or_create
      beer.beer_hourly_data_points.create!(
        temperature: params['Temp'],
        specific_gravity: params['SG']
      )
      render json: { created: true }
    end
  end
end
