# frozen_string_literal: true

require 'test_helper'

module Api
  class HourlyDataPointsControllerTest < ActionDispatch::IntegrationTest
    test 'creating a beer hourly data point' do
      beer = Beer.create(name: 'A beer.', tilt_name: 'A firstly, awesome beer.')
      hydrometer = Hydrometer.create(name: 'RED')
      BeerHourlyDataPoint.create(beer: beer, hydrometer: hydrometer, temperature: 71.0, specific_gravity: 1.0)
      get api_beer_hourly_data_points_path(beer)
      assert_response :success
      assert_equal 1, beer.beer_hourly_data_points.count
      beer.destroy
      hydrometer.destroy
    end

    test 'creating an hourly data point for an existing beer' do
      beer = Beer.create(name: 'A beer.', tilt_name: 'A firstly, awesome beer.')
      hydrometer = Hydrometer.create(name: 'RED')
      post api_hourly_data_points_path,
           params: {
             'Timepoint': '44073.0189925463',
             'Temp': '81.0',
             'SG': '1.036',
             'Beer': beer.tilt_name,
             'Color': hydrometer.name,
             'Comment': 'jarydkrishnan@gmail.com'
           }
      assert_response :success
      assert_equal 1, beer.beer_hourly_data_points.count
      beer.destroy
      hydrometer.destroy
    end

    test 'will create a beer and hydrometer if never seen before' do
      post api_hourly_data_points_path,
           params: {
             'Timepoint': '44073.0189925463',
             'Temp': '81.0',
             'SG': '1.036',
             'Beer': 'Some brand new beer',
             'Color': 'RED',
             'Comment': 'jarydkrishnan@gmail.com'
           }
      assert_response :success
      beer = Beer.where(tilt_name: 'Some brand new beer').first
      hydrometer = Hydrometer.where(name: 'RED').first
      assert_not_nil beer
      assert_not_nil hydrometer
      assert_equal 1, beer.beer_hourly_data_points.count
      assert_equal 1, hydrometer.beer_hourly_data_points.count
      beer.destroy
      hydrometer.destroy
    end
  end
end
