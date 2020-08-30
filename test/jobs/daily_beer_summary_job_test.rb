# frozen_string_literal: true

require 'test_helper'

class DailyBeerSummaryJobTest < ActiveJob::TestCase
  test 'grouping all the hourly data for a beer' do
    beer = Beer.create(name: 'Some awesome beer')
    beer.beer_hourly_data_points.create(
      [
        { specific_gravity: 1.0, temperature: 100.00 },
        { specific_gravity: 2.0, temperature: 200.00 },
        { specific_gravity: 3.0, temperature: 300.00 }
      ]
    )
    DailyBeerSummaryJob.perform_now
    beer_daily_data_point = beer.beer_daily_data_points.where(date: Time.zone.today).first
    assert_not_nil beer_daily_data_point
    assert_equal beer_daily_data_point.avg_specific_gravity, 2.0
    beer.destroy
  end
end
