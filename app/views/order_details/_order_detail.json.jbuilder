json.extract! order_detail, :id, :OrderId, :ProductId, :UnitPrice, :Quantity, :Discount, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)
