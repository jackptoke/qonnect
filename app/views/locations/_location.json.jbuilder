json.extract! location, :id, :client_id, :building_info, :street_address, :suburb, :state, :postcode, :is_billing_address, :created_at, :updated_at
json.url location_url(location, format: :json)
