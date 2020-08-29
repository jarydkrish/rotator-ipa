require 'test_helper'

class Api::BeerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_beer_create_url
    assert_response :success
  end

end
