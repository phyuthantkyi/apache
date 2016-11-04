json.extract! order, :id, :user_name, :address, :phone, :user_email, :product_name, :created_at, :updated_at
json.url order_url(order, format: :json)