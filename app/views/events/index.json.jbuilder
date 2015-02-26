json.array!(@events) do |event|
  json.extract! event, :id, :name, :surname, :telephone, :email, :skype, :location_id
  json.url event_url(event, format: :json)
end
