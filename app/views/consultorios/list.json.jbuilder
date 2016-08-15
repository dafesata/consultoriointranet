json.array!(@consultorios) do |consultorio|
  json.extract! consultorio, :id, :nombre
  json.url consultorio_url(consultorio, format: :json)
end
