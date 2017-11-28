json.extract! event, :id, :name, :startDate, :endDate, :description, :ort, :created_at, :updated_at
json.url event_url(event, format: :json)
