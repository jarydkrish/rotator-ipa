# frozen_string_literal: true

require 'test_helper'

module Api
  class BeerControllerTest < ActionDispatch::IntegrationTest
    test 'creating a beer hourly data point' do
      beer = Beer.create(name: 'A beer.', tilt_name: 'A firstly, awesome beer.')
      post api_beer_url,
           params: {
             'Timepoint': '44073.0189925463',
             'Temp': '81.0',
             'SG': '1.036',
             'Beer': beer.tilt_name,
             'Color': 'RED',
             'Comment': 'jarydkrishnan@gmail.com'
           }
      assert_response :success
      assert_equal 1, beer.beer_hourly_data_points.count
      beer.destroy
    end

    test 'will create a beer if never seen before' do
      post api_beer_url,
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
      assert_not_nil beer
      assert_equal 1, beer.beer_hourly_data_points.count
      beer.destroy
    end
  end
end
