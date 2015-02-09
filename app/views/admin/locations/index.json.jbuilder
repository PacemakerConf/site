json.array!(@locations) do |location|
  json.extract! location, :id, :address, :latitude, :longitude, :conference_id
  json.url location_url(location, format: :json)
end
