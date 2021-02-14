# frozen_string_literal: true

require 'test_helper'

module Api
  class BeerControllerTest < ActionDispatch::IntegrationTest
    test 'creating a beer hourly data point' do
      beer = beers(:beer_one)
      hydrometer = hydrometers(:tilt)
      carboy = carboys(:carboy_one)
      current_hourly_data_points = BeerHourlyDataPoint.count
      params = {
        'Timepoint': '44073.0189925463',
        'Temp': '81.0',
        'SG': '1.036',
        'Beer': beer.tilt_name,
        'Color': hydrometer.name,
        'Comment': 'jarydkrishnan@gmail.com'
      }
      post api_beer_url, params: params
      assert_response :success
      assert_not_equal current_hourly_data_points, BeerHourlyDataPoint.count
    end

    test 'will create a beer and hydrometer if never seen before' do
      params = {
        'Timepoint': '44073.0189925463',
        'Temp': '81.0',
        'SG': '1.036',
        'Beer': 'Some brand new beer',
        'Color': 'BRIGHT_PINK',
        'Comment': 'jarydkrishnan@gmail.com'
      }
      post api_beer_url, params: params
      assert_response :success
      beer = Beer.where(tilt_name: 'Some brand new beer').first
      hydrometer = Hydrometer.where(name: 'BRIGHT_PINK').first
      carboy = Carboy.where(beer: beer, hydrometer: hydrometer).first
      assert_not_nil beer
      assert_not_nil carboy
      assert_not_nil hydrometer
      assert_equal 1, beer.beer_hourly_data_points.count
      assert_equal 1, hydrometer.beer_hourly_data_points.count
      beer.destroy
      carboy.destroy
      hydrometer.destroy
    end
  end
end
