json.array!(@direccions) do |direccion|
  json.extract! direccion, :id, :barrio, :direccion, :tel, :numero_id
  json.url direccion_url(direccion, format: :json)
end
