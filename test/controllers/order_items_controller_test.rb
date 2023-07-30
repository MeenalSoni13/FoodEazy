require "test_helper"

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get order_id:integer" do
    get order_items_order_id:integer_url
    assert_response :success
  end

  test "should get food_item:integer" do
    get order_items_food_item:integer_url
    assert_response :success
  end

  test "should get quantity:integer" do
    get order_items_quantity:integer_url
    assert_response :success
  end
end
