require 'test_helper'

class Account::GalaxiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_galaxies_index_url
    assert_response :success
  end

end
