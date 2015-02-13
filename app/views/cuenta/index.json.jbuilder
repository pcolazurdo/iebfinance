json.array!(@cuenta) do |cuentum|
  json.extract! cuentum, :id
  json.url cuentum_url(cuentum, format: :json)
end
