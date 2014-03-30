json.array!(@contacts) do |contact|
  json.extract! contact, :id, :phone_id, :id_id, :number, :name, :photo, :type
  json.url contact_url(contact, format: :json)
end
