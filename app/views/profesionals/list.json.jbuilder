json.array!(@profesionals) do |profesional|
  json.extract! profesional, :id, :numero_id, :reg_med, :especialidad_id
  json.url profesional_url(profesional, format: :json)
end
