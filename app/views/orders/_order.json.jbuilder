json.extract! order, :id, :CustomerId, :EmployeeId, :orderdate, :RequiredDate, :ShippedDate, :ShipVia, :Freight, :ShipName, :ShipAddress, :ShipCity, :ShipRegion, :ShipPostalCode, :ShipCountry, :created_at, :updated_at
json.url order_url(order, format: :json)
