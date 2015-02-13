json.array!(@cuenta) do |cuentum|
  json.extract! cuentum, :id, :cuenta, :subcuenta1, :subcuenta2, :subcuenta3, :subcuenta4, :subcuenta5, :descripcion, :nombre, :estado, :tipo
  json.url cuentum_url(cuentum, format: :json)
end
