json.array!(@efectivos) do |efectivo|
  json.extract! efectivo, :id, :fecha, :Pesos2, :Pesos5, :Pesos10, :Pesos20, :Pesos50, :Pesos100, :PesosMonedas, :Dolares1, :Dolares2, :Dolares5, :Dolares10, :Dolares20, :Dolares50, :Dolares100, :DolaresMonedas
  json.url efectivo_url(efectivo, format: :json)
end
