# frozen_string_literal: true

require 'test_helper'

module Api
  class BeerControllerTest < ActionDispatch::IntegrationTest
    test 'getting all the beers' do
      beers(:beer_one)
      hydrometers(:tilt)
      get api_beers_url
      assert_response :success
    end

    test 'getting a single beer' do
      beer = beers(:beer_one)
      hydrometers(:tilt)
      get api_beer_url(beer.id)
      assert_response :success
    end
  end
end
