json.array!(@efectivos) do |efectivo|
  json.extract! efectivo, :id
  json.url efectivo_url(efectivo, format: :json)
end
