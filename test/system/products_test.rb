require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Categoryid", with: @product.CategoryId
    fill_in "Discontinued", with: @product.Discontinued
    fill_in "Productname", with: @product.ProductName
    fill_in "Quantityperunit", with: @product.QuantityPerUnit
    fill_in "Reorderlevel", with: @product.ReorderLevel
    fill_in "Supplierid", with: @product.SupplierId
    fill_in "Unitprice", with: @product.UnitPrice
    fill_in "Unitsinstock", with: @product.UnitsInStock
    fill_in "Unitsonorder", with: @product.UnitsOnOrder
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Categoryid", with: @product.CategoryId
    fill_in "Discontinued", with: @product.Discontinued
    fill_in "Productname", with: @product.ProductName
    fill_in "Quantityperunit", with: @product.QuantityPerUnit
    fill_in "Reorderlevel", with: @product.ReorderLevel
    fill_in "Supplierid", with: @product.SupplierId
    fill_in "Unitprice", with: @product.UnitPrice
    fill_in "Unitsinstock", with: @product.UnitsInStock
    fill_in "Unitsonorder", with: @product.UnitsOnOrder
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
