json.extract! ordered_item, :id, :quantity, :price_in_cents, :order_id, :product_id, :created_at, :updated_at
json.url ordered_item_url(ordered_item, format: :json)
