# frozen_string_literal: true

# A daily data point summarizing one day's temperature recordings
class BeerDailyDataPoint < ApplicationRecord
  belongs_to :beer
end
