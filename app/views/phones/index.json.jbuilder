json.array!(@phones) do |phone|
  json.extract! phone, :id, :serial, :brand, :host, :fingerprint, :manufacturer, :model, :incremental, :product, :device, :release
  json.url phone_url(phone, format: :json)
end
