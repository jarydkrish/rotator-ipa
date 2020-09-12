require 'test_helper'

class BeerTest < ActiveSupport::TestCase
  test 'ealiest daily measurement values' do
    beer = Beer.create(name: 'Super Duper Beer')
    daily_data_point = beer.beer_daily_data_points.create(
      avg_temperature: 70.0,
      min_temperature: 65.0,
      max_temperature: 75.0,
      avg_specific_gravity: 1.0,
      min_specific_gravity: 1.0,
      max_specific_gravity: 1.0
    )
    assert_equal beer.earliest_daily_data_point, daily_data_point
    assert_equal beer.earliest_daily_avg_temperature, "#{daily_data_point.avg_temperature.round(2)} °F"
    assert_equal beer.earliest_daily_avg_specific_gravity, daily_data_point.avg_specific_gravity.round(2).to_s
  end

  test 'most recent daily measurement values' do
    beer = Beer.create(name: 'Super Duper Beer part 2')
    daily_data_point = beer.beer_daily_data_points.create(
      avg_temperature: 70.0,
      min_temperature: 65.0,
      max_temperature: 75.0,
      avg_specific_gravity: 1.0,
      min_specific_gravity: 1.0,
      max_specific_gravity: 1.0
    )
    assert_equal beer.most_recent_daily_data_point, daily_data_point
    assert_equal beer.most_recent_daily_avg_temperature, "#{daily_data_point.avg_temperature.round(2)} °F"
    assert_equal beer.most_recent_daily_avg_specific_gravity, daily_data_point.avg_specific_gravity.round(2).to_s
  end

  test 'current_alcohol_content' do
    beer = Beer.create(name: 'Another super beer')
    first_daily_data_point = beer.beer_daily_data_points.create(
      date: Time.zone.today - 1.day,
      avg_temperature: 70.0,
      min_temperature: 65.0,
      max_temperature: 75.0,
      avg_specific_gravity: 1.0,
      min_specific_gravity: 1.0,
      max_specific_gravity: 1.0
    )
    last_daily_data_point = beer.beer_daily_data_points.create(
      date: Time.zone.today,
      avg_temperature: 70.0,
      min_temperature: 65.0,
      max_temperature: 75.0,
      avg_specific_gravity: 0.95,
      min_specific_gravity: 0.95,
      max_specific_gravity: 0.95
    )
    diff = first_daily_data_point.avg_specific_gravity - last_daily_data_point.avg_specific_gravity
    assert_equal beer.current_alcohol_content, diff * 131.25
  end
end
