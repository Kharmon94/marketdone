json.extract! profile, :id, :user_id, :username, :first_name, :last_name, :street_address, :city, :zipcode, :created_at, :updated_at
json.url profile_url(profile, format: :json)
