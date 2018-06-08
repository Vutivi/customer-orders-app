require "application_system_test_case"

class SuppliersTest < ApplicationSystemTestCase
  setup do
    @supplier = suppliers(:one)
  end

  test "visiting the index" do
    visit suppliers_url
    assert_selector "h1", text: "Suppliers"
  end

  test "creating a Supplier" do
    visit suppliers_url
    click_on "New Supplier"

    fill_in "Address", with: @supplier.Address
    fill_in "City", with: @supplier.City
    fill_in "Companyname", with: @supplier.CompanyName
    fill_in "Contactname", with: @supplier.ContactName
    fill_in "Contacttitle", with: @supplier.ContactTitle
    fill_in "Country", with: @supplier.Country
    fill_in "Fax", with: @supplier.Fax
    fill_in "Homepage", with: @supplier.HomePage
    fill_in "Phone", with: @supplier.Phone
    fill_in "Postalcode", with: @supplier.PostalCode
    fill_in "Region", with: @supplier.Region
    click_on "Create Supplier"

    assert_text "Supplier was successfully created"
    click_on "Back"
  end

  test "updating a Supplier" do
    visit suppliers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @supplier.Address
    fill_in "City", with: @supplier.City
    fill_in "Companyname", with: @supplier.CompanyName
    fill_in "Contactname", with: @supplier.ContactName
    fill_in "Contacttitle", with: @supplier.ContactTitle
    fill_in "Country", with: @supplier.Country
    fill_in "Fax", with: @supplier.Fax
    fill_in "Homepage", with: @supplier.HomePage
    fill_in "Phone", with: @supplier.Phone
    fill_in "Postalcode", with: @supplier.PostalCode
    fill_in "Region", with: @supplier.Region
    click_on "Update Supplier"

    assert_text "Supplier was successfully updated"
    click_on "Back"
  end

  test "destroying a Supplier" do
    visit suppliers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Supplier was successfully destroyed"
  end
end
