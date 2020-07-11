json.extract! buyer, :id, :email, :password_digest, :first_name, :last_name, :sex, :birthday, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
