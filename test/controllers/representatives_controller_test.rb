require 'test_helper'

class RepresentativesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get representatives_show_url
    assert_response :success
  end

end
