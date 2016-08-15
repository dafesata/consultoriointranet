json.array!(@servicios) do |servicio|
  json.extract! servicio, :id, :nombre, :enable
  json.url servicio_url(servicio, format: :json)
end
