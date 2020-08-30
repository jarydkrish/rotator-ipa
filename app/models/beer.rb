# frozen_string_literal: true

# A beer that we are brewing
class Beer < ApplicationRecord
  has_many :beer_daily_data_points, dependent: :destroy
  has_many :beer_hourly_data_points, dependent: :destroy
  has_rich_text :recipe
end
