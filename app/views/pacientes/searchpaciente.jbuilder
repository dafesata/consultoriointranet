json.paciente {
json.array!(@pacientes) do |paciente|
  json.extract! paciente, :numero_id
  json.persona do 
  	json.primer_nombre paciente.persona.primer_nombre
  	json.segundo_nombre paciente.persona.segundo_nombre
  	json.primer_apellido paciente.persona.primer_apellido
  	json.segundo_apellido paciente.persona.segundo_apellido
  end
  json.query params[:query]
end
} 
