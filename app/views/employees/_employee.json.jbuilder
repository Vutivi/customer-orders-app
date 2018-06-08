json.extract! employee, :id, :LastName, :FirstName, :Title, :TitleOfCourtesy, :BirthDate, :HireDate, :Address, :City, :Region, :PostalCode, :Country, :HomePhone, :Extension, :Photo, :Notes, :ReportsTo, :PhotoPath, :created_at, :updated_at
json.url employee_url(employee, format: :json)
