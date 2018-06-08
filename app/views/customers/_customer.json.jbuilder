json.extract! customer, :id, :CompanyName, :ContactName, :ContactTitle, :Address, :City, :Region, :PostalCode, :Country, :Phone, :Fax, :created_at, :updated_at
json.url customer_url(customer, format: :json)
