# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get posts_url
    assert_response :success
  end
  test 'should get show' do
    post = posts(:post_one)
    get post_url(post)
    assert_response :success
  end
end
