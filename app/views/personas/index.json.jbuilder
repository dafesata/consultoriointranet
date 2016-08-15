json.array!(@personas) do |persona|
  json.extract! persona, :id, :tipoid, :numero_id, :numero_type, :apellidos, :nombres, :estado_civil, :fecha_nac, :años, :meses, :sexo, :celular
  json.url persona_url(persona, format: :json)
end
