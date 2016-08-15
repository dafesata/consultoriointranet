json.array!(@cita) do |citum|
  json.extract! citum, :id, :paciente_id, :fecha, :hora, :consultorio_id, :servicio_id, :especialidad_id, :profesional_id, :integer, :llegada, :atendido,:riesgo,:psicosocial, :nro_autorizacion, :primera_vez
  json.url citum_url(citum, format: :json)
end
