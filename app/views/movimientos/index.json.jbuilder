json.array!(@movimientos) do |movimiento|
  json.extract! movimiento, :id, :fecha, :IngresoPesos, :IngresoDolares, :EgresoPesos, :EgresoDolares, :Comprobante, :comentario
  json.url movimiento_url(movimiento, format: :json)
end
