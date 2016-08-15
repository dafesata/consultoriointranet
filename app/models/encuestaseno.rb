class Encuestaseno < ApplicationRecord
	validates :paciente_id, :menarquia, :peso,:talla, presence: true

	def self.search(params={})	
		personaid=" "	
		if !(params[:s_identificacion] == "" && params[:s_pnombre] == "" && params[:s_snombre] == "" && params[:s_papellido] == "" && params[:s_sapellido] == "")
			if (Persona.exists?(["primer_nombre LIKE ? AND segundo_nombre LIKE ? AND primer_apellido LIKE ? AND segundo_apellido LIKE ? AND numero_id LIKE ? AND numero_type ='Paciente'", "%#{params[:s_pnombre]}%", "%#{params[:s_snombre]}%", "%#{params[:s_papellido]}%", "%#{params[:s_sapellido]}%", "%#{params[:s_identificacion]}%"]))
				personaid=Persona.where(["primer_nombre LIKE ? AND segundo_nombre LIKE ? AND primer_apellido LIKE ? AND segundo_apellido LIKE ? AND numero_id LIKE ? AND numero_type ='Paciente'", "%#{params[:s_pnombre]}%", "%#{params[:s_snombre]}%", "%#{params[:s_papellido]}%", "%#{params[:s_sapellido]}%", "%#{params[:s_identificacion]}%"]).select(:numero_id).first.numero_id		
			end
		end
		where("numero_id LIKE ? ", "%#{personaid}%")
	end

end
