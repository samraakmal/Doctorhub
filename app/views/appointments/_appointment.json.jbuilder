json.extract! appointment, :id, :created_by, :description, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
