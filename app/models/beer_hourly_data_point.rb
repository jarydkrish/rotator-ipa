# frozen_string_literal: true

# Hourly data point. Might be more often than an hour
class BeerHourlyDataPoint < ApplicationRecord
  belongs_to :beer, touch: true
end
