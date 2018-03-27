json.extract! business, :id, :title, :description, :address, :city, :email, :hours, :number, :created_at, :updated_at
json.url business_url(business, format: :json)
