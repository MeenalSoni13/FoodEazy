require "test_helper"

class CartitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cartitems_new_url
    assert_response :success
  end

  test "should get show" do
    get cartitems_show_url
    assert_response :success
  end

  test "should get edit" do
    get cartitems_edit_url
    assert_response :success
  end
end
