json.extract! sale, :id, :seller_id, :buyer_id, :product_id, :price, :remarks, :created_at, :updated_at
json.url sale_url(sale, format: :json)
