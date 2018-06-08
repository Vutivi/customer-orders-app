json.extract! product, :id, :ProductName, :SupplierId, :CategoryId, :QuantityPerUnit, :UnitPrice, :UnitsInStock, :UnitsOnOrder, :ReorderLevel, :Discontinued, :created_at, :updated_at
json.url product_url(product, format: :json)
