json.array!(@especialidads) do |especialidad|
  json.extract! especialidad, :id, :especialidad_id, :nombre, :servicio_id, :enable
  json.url especialidad_url(especialidad, format: :json)
end
