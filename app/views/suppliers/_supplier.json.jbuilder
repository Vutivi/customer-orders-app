json.extract! supplier, :id, :CompanyName, :ContactName, :ContactTitle, :Address, :City, :Region, :PostalCode, :Country, :Phone, :Fax, :HomePage, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
