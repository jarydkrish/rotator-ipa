class Carboy < ApplicationRecord
  belongs_to :beer
  belongs_to :hydrometer
  has_many :beer_hourly_data_points, dependent: :nullify
end
