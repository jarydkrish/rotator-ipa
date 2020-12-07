# frozen_string_literal: true

require 'test_helper'

module Admin
  class BeersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    test 'viewing a single beer' do
      user = User.create(email: 'some-user@rotatoripa.co', password: 'some-password')
      beer = Beer.create(name: 'A beer.', tilt_name: 'A firstly, awesome beer.')
      sign_in user
      get admin_beer_url(beer)
      assert_response :success
      beer.destroy
      user.destroy
    end
  end
end
