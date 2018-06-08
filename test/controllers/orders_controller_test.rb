require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { CustomerId: @order.CustomerId, EmployeeId: @order.EmployeeId, Freight: @order.Freight, OrderDate: @order.OrderDate, RequiredDate: @order.RequiredDate, ShipAddress: @order.ShipAddress, ShipCity: @order.ShipCity, ShipCountry: @order.ShipCountry, ShipName: @order.ShipName, ShipPostalCode: @order.ShipPostalCode, ShipRegion: @order.ShipRegion, ShipVia: @order.ShipVia, ShippedDate: @order.ShippedDate } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { CustomerId: @order.CustomerId, EmployeeId: @order.EmployeeId, Freight: @order.Freight, OrderDate: @order.OrderDate, RequiredDate: @order.RequiredDate, ShipAddress: @order.ShipAddress, ShipCity: @order.ShipCity, ShipCountry: @order.ShipCountry, ShipName: @order.ShipName, ShipPostalCode: @order.ShipPostalCode, ShipRegion: @order.ShipRegion, ShipVia: @order.ShipVia, ShippedDate: @order.ShippedDate } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
