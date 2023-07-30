require "test_helper"

class FooditemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fooditems_index_url
    assert_response :success
  end

  test "should get new" do
    get fooditems_new_url
    assert_response :success
  end

  test "should get show" do
    get fooditems_show_url
    assert_response :success
  end

  test "should get create" do
    get fooditems_create_url
    assert_response :success
  end
end
