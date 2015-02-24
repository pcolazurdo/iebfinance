json.array!(@ofrendas) do |ofrenda|
  json.extract! ofrenda, :id, :fecha, :montoPesos, :montoDolares, :esCheque, :idcheque, :comentario
  json.url ofrenda_url(ofrenda, format: :json)
end
