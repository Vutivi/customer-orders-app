require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Customerid", with: @order.CustomerId
    fill_in "Employeeid", with: @order.EmployeeId
    fill_in "Freight", with: @order.Freight
    fill_in "Orderdate", with: @order.OrderDate
    fill_in "Requireddate", with: @order.RequiredDate
    fill_in "Shipaddress", with: @order.ShipAddress
    fill_in "Shipcity", with: @order.ShipCity
    fill_in "Shipcountry", with: @order.ShipCountry
    fill_in "Shipname", with: @order.ShipName
    fill_in "Shippostalcode", with: @order.ShipPostalCode
    fill_in "Shipregion", with: @order.ShipRegion
    fill_in "Shipvia", with: @order.ShipVia
    fill_in "Shippeddate", with: @order.ShippedDate
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Customerid", with: @order.CustomerId
    fill_in "Employeeid", with: @order.EmployeeId
    fill_in "Freight", with: @order.Freight
    fill_in "Orderdate", with: @order.OrderDate
    fill_in "Requireddate", with: @order.RequiredDate
    fill_in "Shipaddress", with: @order.ShipAddress
    fill_in "Shipcity", with: @order.ShipCity
    fill_in "Shipcountry", with: @order.ShipCountry
    fill_in "Shipname", with: @order.ShipName
    fill_in "Shippostalcode", with: @order.ShipPostalCode
    fill_in "Shipregion", with: @order.ShipRegion
    fill_in "Shipvia", with: @order.ShipVia
    fill_in "Shippeddate", with: @order.ShippedDate
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
