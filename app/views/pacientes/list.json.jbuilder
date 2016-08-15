json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id, :numero_id, :eps_id, :tipo_usuario,:lugar_nac,:nacionalidad,:escolaridad,:ocupacion,:estrato,:email,:nro_hijos
  json.url profesional_url(paciente, format: :json)
end
