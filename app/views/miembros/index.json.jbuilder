json.array!(@miembros) do |miembro|
  json.extract! miembro, :id, :idFiscal, :nombre, :estado, :tipo, :email, :direccion
  json.url miembro_url(miembro, format: :json)
end
