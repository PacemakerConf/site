json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :surname, :telephone, :email, :skype, :location_id
  json.url contact_url(contact, format: :json)
end
