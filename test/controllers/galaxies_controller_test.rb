require 'test_helper'

class GalaxiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get galaxies_index_url
    assert_response :success
  end

  test "should get show" do
    get galaxies_show_url
    assert_response :success
  end

  test "should get edit" do
    get galaxies_edit_url
    assert_response :success
  end

end
