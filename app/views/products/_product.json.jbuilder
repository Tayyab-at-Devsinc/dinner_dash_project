json.extract! product, :id, :title, :description, :price, :category_id_id, :created_at, :updated_at
json.url product_url(product, format: :json)
