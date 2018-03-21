json.extract! product, :id, :user_id, :title, :description, :price, :shipping_cost, :sold, :condition, :created_at, :updated_at
json.url product_url(product, format: :json)
