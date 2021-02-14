# frozen_string_literal: true

# A reference to the tilt hydrometers
class Hydrometer < ApplicationRecord
  has_many :beer_hourly_data_points, dependent: :nullify
  has_many :beers, -> { distinct }, through: :beer_hourly_data_points
  has_many :carboys, dependent: :nullify
end
