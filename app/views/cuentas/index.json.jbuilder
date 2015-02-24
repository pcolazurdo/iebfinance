json.array!(@cuentas) do |cuenta|
  json.extract! cuenta, :id, :cuenta, :subcuenta1, :subcuenta2, :subcuenta3, :subcuenta4, :subcuenta5, :descripcion, :nombre, :estado, :tipo
  json.url cuenta_url(cuenta, format: :json)
end
