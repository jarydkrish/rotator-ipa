require 'test_helper'

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_show_url
    assert_response :success
  end

end
