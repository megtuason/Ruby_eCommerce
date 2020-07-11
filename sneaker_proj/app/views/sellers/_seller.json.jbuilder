json.extract! seller, :id, :email, :password_digest, :first_name, :last_name, :sex, :birthday, :created_at, :updated_at
json.url seller_url(seller, format: :json)
