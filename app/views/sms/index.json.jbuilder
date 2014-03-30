json.array!(@sms) do |sm|
  json.extract! sm, :id, :phone_id, :id_id, :number, :name, :date, :content, :type
  json.url sm_url(sm, format: :json)
end
