json.array!(@vales) do |vale|
  json.extract! vale, :id, :cuenta, :responsable, :fechaEmision, :fechaRendicion, :estado, :montoPesos, :montoDolares, :comentario
  json.url vale_url(vale, format: :json)
end
