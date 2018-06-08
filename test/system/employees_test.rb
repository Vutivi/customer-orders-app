require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "creating a Employee" do
    visit employees_url
    click_on "New Employee"

    fill_in "Address", with: @employee.Address
    fill_in "Birthdate", with: @employee.BirthDate
    fill_in "City", with: @employee.City
    fill_in "Country", with: @employee.Country
    fill_in "Extension", with: @employee.Extension
    fill_in "Firstname", with: @employee.FirstName
    fill_in "Hiredate", with: @employee.HireDate
    fill_in "Homephone", with: @employee.HomePhone
    fill_in "Lastname", with: @employee.LastName
    fill_in "Notes", with: @employee.Notes
    fill_in "Photo", with: @employee.Photo
    fill_in "Photopath", with: @employee.PhotoPath
    fill_in "Postalcode", with: @employee.PostalCode
    fill_in "Region", with: @employee.Region
    fill_in "Reportsto", with: @employee.ReportsTo
    fill_in "Title", with: @employee.Title
    fill_in "Titleofcourtesy", with: @employee.TitleOfCourtesy
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "updating a Employee" do
    visit employees_url
    click_on "Edit", match: :first

    fill_in "Address", with: @employee.Address
    fill_in "Birthdate", with: @employee.BirthDate
    fill_in "City", with: @employee.City
    fill_in "Country", with: @employee.Country
    fill_in "Extension", with: @employee.Extension
    fill_in "Firstname", with: @employee.FirstName
    fill_in "Hiredate", with: @employee.HireDate
    fill_in "Homephone", with: @employee.HomePhone
    fill_in "Lastname", with: @employee.LastName
    fill_in "Notes", with: @employee.Notes
    fill_in "Photo", with: @employee.Photo
    fill_in "Photopath", with: @employee.PhotoPath
    fill_in "Postalcode", with: @employee.PostalCode
    fill_in "Region", with: @employee.Region
    fill_in "Reportsto", with: @employee.ReportsTo
    fill_in "Title", with: @employee.Title
    fill_in "Titleofcourtesy", with: @employee.TitleOfCourtesy
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee" do
    visit employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee was successfully destroyed"
  end
end
