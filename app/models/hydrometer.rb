# frozen_string_literal: true

# A reference to the tilt hydrometers
class Hydrometer < ApplicationRecord
  has_many :beer_hourly_data_points, dependent: :nullify
  has_many :beers, through: :beer_hourly_data_points
end
