json.array!(@miembros) do |miembro|
  json.extract! miembro, :id
  json.url miembro_url(miembro, format: :json)
end
