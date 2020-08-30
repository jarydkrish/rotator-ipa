require 'test_helper'

class BeersControllerTest < ActionDispatch::IntegrationTest
  test 'showing all the beers' do
    get beers_url
    assert_response :success
  end

  test 'showing just one beer' do
    beer = beers(:beer_one)
    get beer_url(beer)
    assert_response :success
  end
end
