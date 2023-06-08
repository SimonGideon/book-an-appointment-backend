json.extract! house, :id, :name, :address, :description, :city, :photo, :night_price, :created_at, :updated_at
json.url house_url(house, format: :json)
